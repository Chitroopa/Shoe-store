require 'spec_helper'

describe(Store) do

  it("validates presence of name") do
    test_store = Store.new({:name => "", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
    expect(test_store.save()).to eq(false)
  end

  it("validates length of brand name") do
    test_store = Store.new({:name => "zappos Bikemura sandbox Beau Jeu Etrusco Unico sandbox Beau Jeu Etrusco addidas Bikemura addidas Bikemura sandbox Beau Jeu Etrusco Unico sandbox", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
    expect(test_store.save()).to eq(false)
  end

  describe('#capitalize_name') do
    it("capitalize first letter of name") do
      test_store = Store.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
      expect(test_store.name()).to eq("Zappos shoes")
    end
  end

  describe('#brands') do
    it("list all the brands in the store") do
      test_store = Store.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
      test_brand = test_store.brands.create({:name => "addidas", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50.89 })
      expect(test_store.brands()).to eq([test_brand])
    end
  end

  describe('.duplicate_check') do
    it("check for duplicate") do
      test_store1 = Store.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
      expect(Store.duplicate_check('zappos shoes')).to eq(test_store1.id)
    end
  end

end
