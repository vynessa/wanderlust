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
    click_on 'New Activity'
    expect(page).to have_content 'New Activity'
    fill_in('Title', :with => 'See Wakanda movie')
    click_on 'Create Activity'
    expect(page).to have_content 'See Wakanda movie'
  end
end