require 'pry'
class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  before_save(:capitalize_name)
  # before_save(:convert_price)
  scope(:new_brand, -> do
    where({:new_brand => true})
  end)

private

  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end

#   define_method(:convert_price) do
#     price_string = (self.price).to_s
#     if price_string.include?('.0')
#       self.price=(price_string.concat('0')).to_i()
#     end
# binding.pry
#   end

end
