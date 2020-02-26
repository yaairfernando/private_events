# frozen_string_literal: true

require 'rails_helper.rb'

def login
  visit login_path
  within('form') do
    fill_in 'Email', with: @user2.email
  end
  click_button 'Login'
  expect(page).to have_content('Thanks for logging in to the Events site!!')
end

def create_events
  User.destroy_all
  Event.destroy_all

  @user1 = User.create(name: 'Yair', email: 'yair.facio11@gmail.com')
  @user2 = User.create(name: 'John', email: 'john@gmail.com')
  1.upto(10) do
    Event.create(
      name: 'New event', description: 'This is a new event', location: 'Miami',
      date: '12/10/2020 12:03pm', creator_id: @user1.id
    )
  end
  1.upto(10) do
    Event.create(
      name: 'New event', description: 'This is a new event', location: 'Miami',
      date: '12/10/2019 12:03pm', creator_id: @user2.id
    )
  end
end

def invite_attendees
  visit login_path
  within('form') { fill_in 'Email', with: @user2.email }
  click_button 'Login'
  expect(page).to have_content('Thanks for logging in to the Events site!!')
  Event.create(
    name: 'New event', description: 'This is a new event', location: 'Miami',
    date: '12/10/2021 12:03pm', creator_id: @user1.id
  )
  Event.create(
    name: 'Passed event', description: 'This is a new event', location: 'Miami',
    date: '12/10/2019 12:03pm', creator_id: @user2.id
  )
  click_link 'My events'
  first(:link, 'See Details').click
  expect(find('.show_event')).to be_present
  first(:link, 'Yair').click
  expect(page).to have_content('You have successfuly invited a new guest to your event!!!')
  expect(find('.show_event')).to be_present
  expect(page).to have_content('You have 1 invitations pending...')
  click_link 'Logout'
  visit login_path
  within('form') { fill_in 'Email', with: @user1.email }
end

feature 'Events index page' do
  before(:each) { create_events }
  after(:each) { User.destroy_all }

  scenario 'renders successfully when not logged in' do
    visit events_path
    expect(page).to have_content('Check out the most popular events!!!')
    pagination = find_all('.pagination li')
    expect(pagination.count > 2).to be(true)
    first(:link, 'See Details').click
    event = find('.show_event')
    expect(event).to be_present
  end
end

feature 'Events index page' do
  before(:each) { create_events }
  after(:each) { User.destroy_all }

  scenario 'renders successfully when logged in' do
    visit login_path
    user = User.create(name: 'Michelle', email: 'michelle@gmail.com')
    within('form') { fill_in 'Email', with: user.email }
    click_button 'Login'
    expect(page).to have_content('Thanks for logging in to the Events site!!')
    visit events_path
    pagination = find_all('.pagination-events')
    expect(pagination.count).to be(2)
    expect(page).to have_content('Check out the most popular events!!!')
    pagination = find_all('.pagination li')
    expect(pagination.count > 2).to be(true)
    first(:link, 'See Details').click
    event = find('.show_event')
    expect(event).to be_present
  end
end

feature 'Events show page' do
  before(:each) { create_events }
  after(:each) { User.destroy_all }

  scenario 'renders successfully when not logged in' do
    visit events_path
    expect(page).to have_content('Check out the most popular events!!!')
    expect(page).to have_content('See Details')
    pagination = find_all('.pagination li')
    expect(pagination.count > 2).to be(true)
    first(:link, 'See Details').click
    event = find('.show_event')
    expect(event).to be_present
  end
end

feature 'My events' do
  before(:each) do
    create_events
    invite_attendees
  end
  after(:each) { User.destroy_all }

  scenario 'Renders upcomming events' do
    click_button 'Login'
    expect(page).to have_content('Thanks for logging in to the Events site!!')
    click_link 'Invites'
    expect(find_all('.events')).to be_present
    expect(page).to have_content('John is the host')
    click_link 'Accept event invitation'
    expect(page).to have_content('You have successfuly accepted the invitation to this event!!!')
    click_link 'My events'
    click_link 'Upcoming events'
    expect(page).to have_content('New event')
  end
end

feature 'My events' do
  before(:each) do
    create_events
    invite_attendees
  end
  after(:each) { User.destroy_all }

  scenario 'Renders passed events' do
    click_button 'Login'
    expect(page).to have_content('Thanks for logging in to the Events site!!')
    click_link 'Invites'
    expect(find_all('.events')).to be_present
    expect(page).to have_content('John is the host')
    click_link 'Accept event invitation'
    expect(page).to have_content('You have successfuly accepted the invitation to this event!!!')
    click_link 'My events'
    click_link 'Passed events'
    expect(page).to have_content('Passed event')
  end
end

feature 'Events invitations' do
  before(:each) do
    create_events
    visit login_path
    fill_in 'Email', with: @user2.email
    click_button 'Login'
    expect(page).to have_content('Thanks for logging in to the Events site!!')
  end
  after(:each) { User.destroy_all }

  scenario 'Renders Invitations' do
    click_link 'My events'
    first(:link, 'See Details').click
    expect(find('.show_event')).to be_present
    first(:link, 'Yair').click
    expect(page).to have_content('You have successfuly invited a new guest to your event!!!')
    expect(find('.show_event')).to be_present
    expect(page).to have_content('You have 1 invitations pending...')
    visit logout_path
    visit login_path
    within('form') { fill_in 'Email', with: @user1.email }
    click_button 'Login'
    expect(page).to have_content('Thanks for logging in to the Events site!!')
    click_link 'Invites'
    expect(find_all('.events')).to be_present
    expect(page).to have_content('John is the host')
  end
end

feature 'Events invitations' do
  before(:each) do
    create_events
    login
  end
  after(:each) { User.destroy_all }

  scenario 'Sends an invitation to an event' do
    first(:link, 'See Details').click
    expect(find('.show_event')).to be_present
    first(:link, 'Yair').click
    expect(page).to have_content('You have successfuly invited a new guest to your event!!!')
    expect(find('.show_event')).to be_present
    expect(page).to have_content('You have 1 invitations pending...')
  end
end
