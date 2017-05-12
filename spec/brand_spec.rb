require 'spec_helper'

describe(Brand) do

  it("validates presence of name") do
    test_brand = Brand.create({:name => "", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50.89 })
    expect(test_brand.save()).to eq(false)
  end

  describe('#capitalize_name') do
    it("capitalize first letter of name") do
      test_brand = Brand.create({:name => "addidas", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50.89 })
      expect(test_brand.name()).to eq("Addidas")
    end
  end

  describe('#stores') do
    it("list all the stores that sells the particular brand") do
      test_brand = Brand.create({:name => "addidas", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50.89 })
      test_store = test_brand.stores.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
      expect(test_brand.stores()).to eq([test_store])
    end
  end

  describe('.new_brands') do
    it("list all the new brands") do
      test_brand1 = Brand.create({:name => "addidas", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50.89 })
      test_brand2 = Brand.create({:name => "zappos", :quantity => 20 ,:new_brand => false, :sold_out => false, :price => 50.89 })
      expect(Brand.new_brand()).to eq([test_brand1])
    end
  end

  it("append '.00' if the price is whole number") do
    test_brand1 = Brand.create({:name => "addidas", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50.60})
    expect(test_brand1.convert_price()).to eq("50.60")
  end

  describe('.duplicate_check') do
    it("check for duplicate") do
      test_brand1 = Brand.create({:name => "addidas", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50})
      expect(Brand.duplicate_check("addidas")).to eq(test_brand1.id)
    end
  end

end
