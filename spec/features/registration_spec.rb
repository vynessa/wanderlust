require 'rails_helper'

feature "Registration", type: :feature do
  scenario 'allows a user to register' do
    visit new_user_registration_path
    fill_in 'Email', :with => 'newuser@example.com'
    fill_in 'Password', :with => 'userpassword'
    fill_in 'Password confirmation', :with => 'userpassword'
    click_button 'Create Account'
    expect(page).to have_content 'No trips here. Create a trip'
  end

  scenario 'does not allow a user to register with invalid credentials' do
    visit new_user_registration_path
    fill_in 'Email', :with => 'newuser@example.com'
    fill_in 'Password', :with => 'xxx'
    fill_in 'Password confirmation', :with => 'xxxx'
    click_button 'Create Account'
    expect(page).to have_content 'Email has already been taken'
  end
end
