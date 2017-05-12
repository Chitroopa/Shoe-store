require("bundler/setup")
Bundler.require(:default)
require("pry")

ENV['RACK_ENV'] = 'test'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stores = Store.all()
  erb(:index)
end

get '/stores/add' do
  erb(:store_form)
end

post '/stores/add' do
  name = params[:name]
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zipcode = params[:zipcode]
  if Store.duplicate_check(name) == 0
    new_store = Store.new({:name => name, :street => street, :city => city, :state => state, :zipcode => zipcode})
    if new_store.save()
      redirect("/")
    else
      @errors = new_store
      erb(:store_form)
    end
  else
    exsitsing_store = Store.find(Store.duplicate_check(name))
    exsitsing_store.update({:name => name, :street => street, :city => city, :state => state, :zipcode => zipcode})
    redirect("/")
  end
end
