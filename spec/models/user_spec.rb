require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    before(:all) do
      User.create(name:'John', email: '1@2three', password: 'testtest', password_confirmation: 'testtest')
    end

    it "is not valid without a password" do
      @user = User.create({name: 'test', email: 'test@test', password_confirmation: 'testtest'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end 

    it "is not valid without a password_confirmation" do
      @user = User.create({name: 'test', email: 'test@test', password: 'testtest'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end 

    it "is not valid without a matching password and confirmation" do
      @user = User.create({name: 'test', email: 'test@test', password: 'setttest', password_confirmation: 'testtest'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end 


    it "must have a unique email" do
      @user = User.create({name: 'test', email: '1@2three', password: 'testtest', password_confirmation: 'testtest'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "must have a unique email regardless of case" do
      @user = User.create({name: 'test', email: '1@2THREE', password: 'testtest', password_confirmation: 'testtest'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "is not valid without a name" do
      @user = User.create({email: 'test@test', password: 'testtest', password_confirmation: 'testtest'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "is not valid without an email" do
      @user = User.create({name: 'test', password: 'testtest', password_confirmation: 'testtest'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "has minimum password length of 6 characters" do
      @user = User.create({name: 'test', email: 'test@test', password: 'test', password_confirmation: 'test'})
      puts @user.errors.full_messages
      expect(@user.errors.full_messages).to_not be_empty
    end

  end
end
