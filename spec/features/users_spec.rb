require 'rails_helper'

RSpec.feature "Users" do
  context "Log in a user" do
    scenario "should be successful" do
      visit login_path
      within('form') do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Name', with: 'john'
      end
      click_button 'Sign up'
      expect(page).to have_content("You have created an account!")
    end
  end
end
