require 'rails_helper'

RSpec.describe "Event model", type: :model do
  fixtures :events

  before(:each) do
    @new_event = events(:my_event)
    @user = User.create(name: "Example User", email: "user@example.com")
    @new_event.creator_id = @user.id
  end
  
  after(:each) do
    @user.destroy
    @new_event.destroy
  end

  describe "Model validations" do
    it "is valid with valid attributes" do
      expect(@new_event.valid?).to eq(true)
    end

    it "is invalid with invalid location" do
      @new_event.location = ''
      expect(@new_event.valid?).to eq(false)
    end

    it "is invalid with invalid description" do
      @new_event.description = ''
      expect(@new_event.valid?).to eq(false)
    end

    it "is invalid with too long description" do
      @new_event.description = '*' * 341
      expect(@new_event.valid?).to eq(false)
    end

    it "is invalid with invalid name" do
      @new_event.name = ''
      expect(@new_event.valid?).to eq(false)
    end

    it "is invalid with invalid date" do
      @new_event.date = ''
      expect(@new_event.valid?).to eq(false)
    end

    it "is invalid with invalid creator" do
      @new_event.creator_id = ''
      expect(@new_event.valid?).to eq(false)
    end
  end
end