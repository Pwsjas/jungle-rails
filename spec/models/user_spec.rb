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

  describe '.authenticate_with_credentials' do
   
    before(:all) do
      User.create({name: 'test', email: "a@b", password: 'testtest', password_confirmation: 'testtest'})
      @user = User.find_by_email('a@b')
    end

    it "will return nil if there is no email" do
      user = User.authenticate_with_credentials(nil, 'testtest')
      expect(user).to eq(nil)
    end

    it "will return nil if there is no password" do
      user = User.authenticate_with_credentials('a@b', nil)
      expect(user).to eq(nil)
    end

    it "will return the user if passed valid credentials" do
      user = User.authenticate_with_credentials("a@b", 'testtest')
      expect(user).to eq(@user)
    end

    it "will return the user if passed valid poorly input credentials" do
      user = User.authenticate_with_credentials("  a@b ", 'testtest')
      expect(user).to eq(@user)
    end

    it "will return nill if passed invalid credentials" do
      user = User.authenticate_with_credentials("tewalinwatg", "klnteqtgoeq")
      expect(user).to eq(nil)
    end

  end
end
