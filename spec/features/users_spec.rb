require 'rails_helper'

feature "User" do
  context "signs up" do
    scenario "with valid name and email" do
      visit signup_path
      within('form') do
        fill_in 'Name', with: 'john'
        fill_in 'Email', with: 'john@gmail.com'
      end
      click_button 'Sign up'
      expect(page).to have_content("You have created an account!")
    end
    
    scenario "with blank name" do
      visit signup_path
      within('form') do
        fill_in 'Name', with: ''
        fill_in 'Email', with: 'john@gmail.com'
      end
      click_button 'Sign up'
      expect(page).to have_content("Name can't be blank")
    end
    
    scenario "with invalid email" do
      visit signup_path
      within('form') do
        fill_in 'Name', with: 'john'
        fill_in 'Email', with: 'johngmail.com'
      end
      click_button 'Sign up'
      expect(page).to have_content("Email is invalid")
    end
  end
  
  context "logs in" do
    scenario "with valid user email" do
      visit signup_path
      within('form') do
        fill_in 'Name', with: 'john'
        fill_in 'Email', with: 'john@gmail.com'
      end
      count = User.count
      click_button 'Sign up'
      expect(User.count).to eq(count + 1)
      expect(page).to have_content("You have created an account!")
      expect(page).to have_content("john")

    end

    scenario "with not registered user email" do
      visit login_path
      within('form') do
        fill_in 'Email', with: ''
      end
      click_button 'Login'
      expect(page).to have_content("Check your email!")
    end
  end

  context "logs out" do
    scenario "itself" do
      visit signup_path
      within('form') do
        fill_in 'Name', with: 'john'
        fill_in 'Email', with: 'john@gmail.com'
      end
      click_button 'Sign up'
      click_link 'Logout'
      expect(page).to have_content('You have logged out!!')
    end
  end
end
