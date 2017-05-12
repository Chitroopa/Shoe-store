require 'spec_helper'

describe('Shoe Brand',{:type => :feature}) do
  it('View all brand list') do
    test_brand = Brand.create({:name => "addidas", :quantity => 20 ,:new_brand => true, :sold_out => false, :price => 50.89 })
    visit('/brands/list')
    expect(page).to have_content('Addidas')
    click_on("Check details")
    expect(page).to have_content('Addidas')
    expect(page).to have_content('Available in below stores')
  end

  it('Add new brand') do
    visit('/brands/add')
    fill_in('name', :with => 'adidas brazuca')
    fill_in('quantity', :with => 45)
    select('New Brand', from: 'new_brand')
    select('Available', from: 'sold_out')
    fill_in('price', :with => '45.89')
    click_button("Submit")
    expect(page).to have_content('Adidas brazuca')
  end

end
