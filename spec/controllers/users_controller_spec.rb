# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # fixtures :users

  # before(:each) do
  #   @user = users(:yair)
  # end

  # after(:each) do
  #   @user.destroy
  # end

  it 'get signup should render template NEW' do
    get :new
    expect(response).to render_template('users/new')
  end

  it 'newly created user gets logged in' do
    expect(logged_in?).to be(false)
    post :create, params: { user: { name: 'Example',
      email: "example@example.com" } }
    expect(logged_in?).to be(true)  
    user = User.last
    user.destroy
  end

  it 'create action redirects to a new user page with valid credentials' do
    post :create, params: { user: { name: 'Example',
      email: "example@example.com" } }
    user = User.last
    expect(response).to redirect_to(user)
    expect(flash.present?).to be(true)
    user.destroy
  end

  it 'create action renders a new template with invalid credentials' do
    post :create, params: { user: { name: '',
      email: "example@example.com" } }
    expect(response).to render_template('users/new')
    expect(flash.present?).to be(false)
  end
end