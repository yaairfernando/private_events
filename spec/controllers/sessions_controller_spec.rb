# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  fixtures :users

  it 'it redirects to current user page if logged in' do
    user = users(:yair)
    log_in user
    get :new
    expect(response).to redirect_to(user_path(user))
  end

  it "it renders template NEW if nobody isn't logged in" do
    get :new
    expect(response).to render_template('sessions/new')
  end

  it 'it creates a session with valid email' do
    user = users(:yair)
    expect(logged_in?).to be(false)
    post :create, params: { session: { email: user.email } }
    expect(logged_in?).to be(true)
    expect(flash[:success].present?).to be(true)
    expect(response).to redirect_to(user_path(user))
  end

  it 'renders login if email not valid' do
    expect(logged_in?).to be(false)
    post :create, params: { session: { email: 'not_an_actual_email' } }
    expect(logged_in?).to be(false)
    expect(flash[:danger].present?).to be(true)
    expect(response).to render_template('sessions/new')
  end

  it 'logs out if somebody is logged in' do
    user = users(:yair)
    expect(logged_in?).to be(false)
    post :create, params: { session: { email: user.email } }
    expect(logged_in?).to be(true)
    get :destroy
    expect(logged_in?).to be(false)
    expect(flash[:info].present?).to be(true)
    expect(response).to redirect_to(login_path)
  end

  it "logging out redirects to log in path if nobody isn't logged in" do
    expect(logged_in?).to be(false)
    get :destroy
    expect(logged_in?).to be(false)
    expect(flash[:info].present?).to be(true)
    expect(response).to redirect_to(login_path)
  end
end
