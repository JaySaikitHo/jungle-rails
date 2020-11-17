require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validation password' do
    it "should have error because password and password_confirmation are different " do
    
    @user = User.new
    @user.first_name = 'Jack'
    @user.last_name = 'Smith'
    @user.email = 'test@test.com'
    @user.password = 'hi'
    @user.password_confirmation = 'hello'

    @user.save
    # puts @user.errors.full_messages.inspect
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should have same password and password_confirmation" do
    @user = User.new
    @user.first_name = 'Jack'
    @user.last_name = 'Smith'
    @user.email = 'test@test.com'
    @user.password_confirmation = "test"
    @user.password = "test"
    @user.save

    expect(@user).to be_valid   
    end
  
    it "should have error because password is blank" do 
      @user = User.new
      @user.password = nil
      @user.password_digest = nil
      @user.save
      # puts @user.errors.full_messages.inspect
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should have an error because password is too short" do
    @user = User.new
    @user.first_name = 'Jack'
    @user.last_name = 'Smith'
    @user.email = 'test@test.com'
    @user.password_confirmation = "A"
    @user.password = "A"
    @user.save
      
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

    it "should have an error because password is too long" do
    @user = User.new
    @user.first_name = 'Jack'
    @user.last_name = 'Smith'
    @user.email = 'test@test.com'
    @user.password_confirmation = "abcdefghijklmnopqrstuvwxyz"
    @user.password = "abcdefghijklmnopqrstuvwxyz"
    @user.save
    puts @user.errors.full_messages.inspect   
    expect(@user.errors.full_messages).to include("Password is too long (maximum is 20 characters)")
    end
  end

    context "email validations " do 
      @user1 = User.new(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'Jay', password_digest: 'Jay')
      @user1.save
      it 'validates email uniqueness' do
        @email = 'test@test.com'
        @user2 = User.new(first_name: 'Jane', last_name: 'Doe', email: @email, password: 'Mako', password_digest: 'Mako')
        # puts @user2.errors.full_messages
        expect(@user2).to_not be_valid
      end
      it "validates case sensitivity isn't an issue" do 
        @email = 'test@test.com'
        @user2 = User.new(first_name: 'Jane', last_name: 'Doe', email: 'TEST@test.com', password: 'Sena', password_digest: 'Sena')
        # puts @user2.errors.full_messages
        expect(@user2).to_not be_valid
      end
    end
  
  describe "name validation" do
      it 'should have an error because first name is blank' do
      @user1 = User.new(first_name: '' , last_name: 'Smith', email: 'test@test.com', password: 'Hibiki', password_digest: 'Hibiki')
      @user1.save
      expect(@user1).to_not be_valid
      end
      it'should have an error because last name is blank' do
      @user1 = User.new(first_name: 'Mister' , last_name: '', email: 'test@test.com', password: 'Hibiki', password_digest: 'Hibiki')
      @user1.save
      # puts @user1.errors.full_messages
      expect(@user1).to_not be_valid  
      end
  end

  describe '.authenticate_with_credientials' do

    it 'returns the user if you have the correct credentials' do
    actual_user = User.create(first_name: 'Dude', last_name: 'Man', password: 'test', password_confirmation: 'test', email: 'test@abc.com')
    test_user = User.authenticate_with_credentials('test@abc.com', 'test')
    expect(actual_user).to eq(test_user)
    end
      
    it 'returns nil' do
    actual_user = User.create(first_name: 'Man', last_name: 'Guy', password: 'test', password_confirmation: 'test', email: 'test@abc.com') 
    
    @invaliduser = User.authenticate_with_credentials('test@abc.com', 'nottest')
    expect(@invaliduser).to eq nil
    end
    
    
  
    it 'should authenticate if user adds uppercase letters to their email' do
      user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      user.save
      valid_user = User.authenticate_with_credentials('EMAIL@email.com', 'apples')
      expect(valid_user).to eq(user)
    end
    it 'should authenticate if user adds spaces to beginning or end of email' do
      user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      user.save
      valid_user = User.authenticate_with_credentials(' email@email.com ', 'apples')
      expect(valid_user).to eq(user)
    end
  
  end


end
