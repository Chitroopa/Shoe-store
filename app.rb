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
  @brands = Brand.all()
  erb(:store_form)
end

get '/stores/view/:store_id' do
  store_id = params[:store_id]
  @store = Store.find(store_id)
  erb(:store)
end

get '/stores/view/:store_id/edit' do
  store_id = params[:store_id]
  @store = Store.find(store_id)
  @brands = Brand.all()
  erb(:store_edit)
end

get '/brands/list' do
  @brands = Brand.new_brand()
  erb(:brands)
end

get '/brands/add' do
  erb(:brand_form)
end

get '/brands/view/:brand_id' do
  brand_id = params[:brand_id]
  @brand = Brand.find(brand_id)
  erb(:brand)
end

post '/stores/add' do
  name = params[:name]
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zipcode = params[:zipcode]
  brand_ids = params[:brand_ids]
  if Store.duplicate_check(name) == 0
    new_store = Store.new({:name => name, :street => street, :city => city, :state => state, :zipcode => zipcode})
    new_store.update({:brand_ids => brand_ids})
    if new_store.save()
      redirect("/")
    else
      @errors = new_store
      erb(:store_form)
    end
  else
    exsitsing_store = Store.find(Store.duplicate_check(name))
    exsitsing_store.update({:street => street, :city => city, :state => state, :zipcode => zipcode})
    redirect("/")
  end
end

post '/brands/add' do
  name = params[:name]
  quantity = params[:quantity]
  new_brand = params[:new_brand]
  sold_out = params[:sold_out]
  price = params[:price].to_f()
  if Brand.duplicate_check(name) == 0
    new_brand = Brand.new({:name => name, :quantity => quantity ,:new_brand => new_brand, :sold_out => sold_out, :price => price})
    if new_brand.save()
      redirect "/brands/list"
    else
      @errors = new_brand
      erb(:brand_form)
    end
  else
    exsitsing_brand = Brand.find(Brand.duplicate_check(name))
    exsitsing_brand.update({:quantity => quantity ,:new_brand => new_brand, :sold_out => sold_out, :price => price})
    redirect "/brands/list"
  end
end

post '/stores/view/:store_id/edit' do
  store_id = params[:store_id]
  @store = Store.find(store_id)
  @brands = Brand.all()
  erb(:store_edit)
end

patch '/stores/view/:store_id/edit' do
  store_id = params[:store_id]
  @store = Store.find(store_id)
  name = params[:name]
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zipcode = params[:zipcode]
  if Store.duplicate_check(name) == 0 || Store.duplicate_check(name) == store_id.to_i()
    @store.update({:name => name, :street => street, :city => city, :state => state, :zipcode => zipcode})
    redirect '/stores/view/'.concat(store_id.to_s())
  else
    @errors = name + " store name already exists on database, please enter a different name"
    erb(:store_edit)
  end
end

patch '/stores/view/:store_id/edit/brands/add' do
  store_id = params[:store_id]
  @store = Store.find(store_id)
  brand_ids = params[:brand_ids]
  brand_ids.each do |brand_id|
    brand = Brand.find(brand_id)
    @store.brands.push(brand)
  end
  redirect '/stores/view/'+ store_id.to_s() +'/edit'
end

delete '/stores/view/:store_id/delete' do
  store_id = params[:store_id]
  @store = Store.find(store_id)
  @store.delete()
  redirect '/'
end

delete '/stores/view/:store_id/edit/brands/add' do
  store_id = params[:store_id]
  @store = Store.find(store_id)
  brand_ids = params[:brand_ids]
  brand_ids.each do |brand|
    @store.brands.delete(brand)
  end
  redirect '/stores/view/'+ store_id.to_s() +'/edit'
end
