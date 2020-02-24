# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  fixtures :users
  fixtures :events

  # before(:each) do
  #   @user = users(:yair)
  # end

  # after(:each) do
  #   @user.destroy
  # end

  it "get '/events' should render template INDEX" do
    get :index
    expect(response).to render_template('events/index')
  end
  
  it "get '/events/new' should render template NEW" do
    get :new
    expect(response).to render_template('events/new')
  end

  it 'event created with valid params gets redirected to user page' do
    user = users(:yair)
    log_in user
    post :create, params: { 
      event: {        name: 'Alice Birthday',
                  location: "Wonderland", 
               description: "Spend wonderful time with Alice!",
                      date: DateTime.now,
                creator_id: user.id } }
    expect(flash[:success].present?).to be(true)
    expect(response).to redirect_to(user_path(user))
  end

  it 'event created with invalid params renders template NEW' do
    user = users(:yair)
    log_in user
    post :create, params: { 
      event: {        name: 'Alice Birthday',
                  location: "Wonderland", 
               description: "Spend wonderful time with Alice!",
                creator_id: user.id } }
    expect(response).to render_template('events/new')
  end

  it 'redirects to event path after successful invitation' do
    user = users(:yair)
    log_in user
    post :create, params: { 
      event: {        name: 'Alice Birthday',
                  location: "Wonderland", 
               description: "Spend wonderful time with Alice!",
                      date: DateTime.now,
                creator_id: user.id } }
    event = Event.last
    attendee = users(:jaak)
    get :invite, params: { id: event.id, user_id: attendee.id }
    expect(flash[:success].present?).to be(true)
    expect(response).to redirect_to(event_path(event))
  end

  it 'renders the event path after unsuccessful invitation' do
    user = users(:yair)
    log_in user
    post :create, params: { 
      event: {        name: 'Alice Birthday',
                  location: "Wonderland", 
               description: "Spend wonderful time with Alice!",
                      date: DateTime.now,
                creator_id: user.id } }
    event = Event.last
    attendee = users(:jaak)
    get :invite, params: { id: event.id, user_id: (attendee.id - 1) }
    expect(flash[:danger].present?).to be(true)
    expect(response).to redirect_to(event_path(event))
  end

  # it 'newly created user gets logged in' do
  #   expect(logged_in?).to be(false)
  #   post :create, params: { user: { name: 'Example',
  #     email: "example@example.com" } }
  #   expect(logged_in?).to be(true)
  #   user = User.last
  #   user.destroy
  # end

  # it 'create action redirects to a new user page with valid credentials' do
  #   post :create, params: { user: { name: 'Example',
  #     email: "example@example.com" } }
  #   user = User.last
  #   expect(response).to redirect_to(user)
  #   expect(flash.present?).to be(true)
  #   user.destroy
  # end

  # it 'create action renders a new template with invalid credentials' do
  #   post :create, params: { user: { name: '',
  #     email: "example@example.com" } }
  #   expect(response).to render_template('users/new')
  #   expect(flash.present?).to be(false)
  # end

  # it 'render the show template' do
  #   user = users(:yair)
  #   get :show, params: { id: user.id }
  #   expect(response).to render_template :show
  #   user.destroy
  # end
  
  # it 'render the invited events template' do
  #   post :create, params: { user: { name: 'Example',
  #     email: "example@example.com" } }
  #   expect(logged_in?).to be(true)
  #   get :invited_events
  #   expect(response).to render_template :invited_events
  # end
end