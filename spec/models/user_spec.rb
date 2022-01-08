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

    it "password don't match" do
      user = User.new(
        name: 'user_name',
        email: 'testing@test.com',
        password: 'password',
        password_confirmation: 'passwo'
      )
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
    end

    it 'email must be not already exist in db' do
      user = User.new
      user.name = 'name'
      user.email = 'test@test.com'
      user.password = 'password'
      user.password_confirmation = 'password'

      user.save
    
      user2 = User.new
      user2.name = 'name'
      user2.email = 'test@test.com'
      user2.password = 'password'
      user2.password_confirmation = 'password'

      user2.save
    
      expect(user2).to be_invalid
    end

    it 'password length to be minimum 5 characters' do
      # invalid entry
      user = User.new
      user.name = "name"
      user.email = 'test@test.com'
      user.password = '1234'
      user.password_confirmation = '1234'
      expect(user).to be_invalid
      # invalid entry
      user = User.new
      user.name = "name"
      user.email = 'test@test.com'
      user.password = '12345'
      user.password_confirmation = '12345'
      expect(user).to be_valid
    end
  end
end