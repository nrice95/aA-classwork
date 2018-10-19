# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up"
    expect(page).to_not have_content "Sign Down"
  end

  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in "username", :with => "Abc"
      fill_in "password", :with => "starwars"
      click_on "Sign Up"
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "Abc"
    end
  end
end

feature 'logging in' do

  let(:user) {create(:user)}
  before(:each) do
    visit new_session_url
    fill_in "username", :with => user.username
    fill_in "password", :with => user.password
    click_on "Log In"
  end

    scenario 'shows username on the homepage after login' do
      expect(page).to have_content user.username
    end
  end

feature 'logging out' do
  let(:user) {create(:user)}
  before {visit root_url}
  scenario 'begins with a logged out state' do
    expect(page).to have_content "Log In"
    expect(page).to_not have_content "Log Out"
  end


  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    fill_in "username", :with => user.username
    fill_in "password", :with => user.password
    click_on "Log In"
    click_on "Log Out"
    expect(page).to_not have_content user.username
  end

end
