require 'spec_helper'

describe('Store',{:type => :feature}) do
  it('on click of store name, displays store details') do
    test_store = Store.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
    visit('/')
    click_on("Zappos shoes")
    expect(page).to have_content('Located at:')
  end

  it('on click of edit store, displays edit page') do
    test_store = Store.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
    visit("/stores/view/#{test_store.id}")
    click_button("Edit store")
    expect(page).to have_content('Edit Zappos shoes information')
  end

  it('edit store name and save it') do
    test_store = Store.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
    visit("/stores/view/#{test_store.id}/edit")
    fill_in('name', :with => 'addidas shoes')
    click_button("Save changes")
    expect(page).to have_content('Addidas shoes')
  end

  it('on click of delete store, that store is deleted') do
    test_store = Store.create({:name => "zappos shoes", :street => "123, 3rd Ave", :city =>"Seattle", :state => 'WA', :zipcode => 98034})
    visit("/stores/view/#{test_store.id}")
    click_button("Delete Zappos shoes")
    expect(page).to have_content('No stores yet')
  end

  it('add a new store') do
    visit("/stores/add")
    fill_in('name', :with => 'addidas shoes')
    fill_in('street', :with => '123, 4th ave')
    fill_in('city', :with => 'Seattle')
    select('WA', from: 'state')
    fill_in('zipcode', :with => 98043)
    click_button("Submit")
    expect(page).to have_content('Addidas shoes')
  end
end
