require "rails_helper"
require "spec_helper"

describe "Trips", :type => :feature do
  before(:all) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  after(:all) do
    Warden.test_reset!
  end

  scenario "allows an authenticated user create a new trip", js: true do
    visit trips_path
    expect(page).to have_content 'No trips here. Create a trip'
    click_on 'CREATE TRIP'
    expect(page).to have_content 'New Trip'
    fill_in('Name', :with => 'Wakanda with Andela')
    fill_in('Description', :with => 'Wakanda Forever')
    fill_in('Location', :with => 'IMAX Lekki')
    fill_in('Departure date', :with => '2018-02-24')
    fill_in('Return date', :with => '2018-02-24')
    click_on 'Create Trip'
    expect(page).to have_content 'IMAX Lekki'
    expect(page).to have_content 'Wakanda with Andela'
    find("a.card-body").click
    expect(page).to have_content 'New Activity'
    click_on 'New Budget Item'
    expect(page).to have_content 'New Budget Item'
    fill_in('Item', :with => 'My Budget')
    fill_in('Description', :with => 'Make sense budget')
    fill_in('Cost', :with => '200000')
    click_on 'Create Budget item'
    expect(page).to have_content 'Budget item was successfully created.'
    click_on 'Edit Budget Item'
    fill_in('Item', :with => 'New Budget')
    fill_in('Description', :with => 'A new budget')
    fill_in('Cost', :with => '200')
    click_on 'Update Budget item'
    expect(page).to have_content 'Budget item was successfully updated.'
    expect(page).to have_content 'New Budget'
  end
end
