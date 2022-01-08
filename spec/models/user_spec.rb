require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'user validations' do
    it "is valid" do
      user = User.new(
        name: 'user_name',
        email: 'testing@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it "email not entered" do
      # invalid entry
      user = User.new(email: nil)
      expect(user).to be_invalid
      # valid entry
      user.email = 'test@test.com'
      user.valid?
      expect(user.errors[:email]).not_to include("can't be blank")
    end

    it "name not entered" do
      # invalid entry
      user = User.new(name: nil)
      expect(user).to be_invalid
      # valid entry
      user.name = 'name'
      user.valid? 
      expect(user.errors[:name]).not_to include("can't be blank")
    end

  end
end