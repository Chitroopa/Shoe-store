require 'pry'
class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  before_save(:capitalize_name)
  scope(:new_brand, -> do
    where({:new_brand => true})
  end)

  def self.duplicate_check(name)
    brand_id = 0
    Brand.all.each do |brand|
      if brand.name.gsub(/[^a-z," "]/i, '').downcase() == name.gsub(/[^a-z," "]/i, '').downcase()
        brand_id = brand.id
      end
    end
    brand_id
  end

  def convert_price
    return sprintf "%.2f", self.price
  end

private

  def capitalize_name
    self.name=(name().capitalize())
  end

end
