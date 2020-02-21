require 'rails_helper'

RSpec.describe "User Model", type: :model do 
  fixtures :users

  before(:each) do
    @user = users(:yair)
  end

  after(:each) do
    @user.destroy
  end

  describe "User validations" do
    it 'is valid with valid attributes' do
      expect(@user.valid?).to be(true)
    end

    it 'is not valid without name' do
      @user.name = ''
      expect(@user.valid?).to be(false)
    end

    it 'is not valid with too long name' do
      @user.name = 'a' * 51
      expect(@user.valid?).to be(false)
    end

    it 'is not valid with unvalid email' do
      @user.email = 'yair.facio.gmail.com'
      expect(@user.valid?).to be(false)
    end

    it 'is not valid with too long email' do
      @user.email = 'a' * 255 + "@gmail.com"
      expect(@user.valid?).to be(false)
    end
  end
end