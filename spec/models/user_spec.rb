require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'is valid when all attributes are present' do
      @user = User.create
      
      @user.name='John'
      @user.last_name = 'Smith'
      @user.email = 'john@smith.com'
      @user.password = 'password'
      @user.password_confirmation = 'password'

      expect(@user).to be_valid
    end

    it 'is valid when password and password_confirmation match' do
      @user = User.create
      
      @user.name='John'
      @user.last_name = 'Smith'
      @user.email = 'john@smith.com'
      @user.password='password'
      @user.password_confirmation='password'

      expect(@user).to be_valid
    end

    it 'is valid when email is unique' do
      @user1 = User.new
      @user2 = User.new
      
      @user1.name='John'
      @user1.last_name = 'Smith'
      @user1.email = 'john@smith.com'
      @user1.password='password'
      @user1.password_confirmation='password'

      @user2.name='John'
      @user2.last_name = 'Smith'
      @user2.email = 'john@smith.com'
      @user2.password='password'
      @user2.password_confirmation='password'

      @user1.save
      @user2.save

      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end

    it 'is not valid when email is already taken, not case sensitive' do
      @user1 = User.new
      @user2 = User.new
      
      @user1.name='John'
      @user1.last_name = 'Smith'
      @user1.email = 'john@smith.com'
      @user1.password='password'
      @user1.password_confirmation='password'

      @user2.name='John'
      @user2.last_name = 'Smith'
      @user2.email = 'JOHN@SMITH.COM'
      @user2.password='password'
      @user2.password_confirmation='password'

      @user1.save
      @user2.save

      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end

    it 'is not valid when password is shorter than 6 characters' do
      @user = User.new
      
      @user.name='John'
      @user.last_name = 'Smith'
      @user.email = 'john@smith.com'
      @user.password='meow'
      @user.password_confirmation='meow'

      @user.save
      expect(@user).to_not be_valid
    end
    
    describe '.authenticate_with_credentials' do
      it 'is valid when email and password match' do
        user = User.create(
          name:'John', 
          last_name:'Smith',
          email:'john@smith.com',
          password:'password',
          password_confirmation:'password')
        
        authenticated_user = user.authenticate_with_credentials('john@smith.com', 'password')
        expect(authenticated_user).to eql(user)
      end

      it 'is valid when email is uppercase' do
        user = User.create(
          name:'John', 
          last_name:'Smith',
          email:'john@smith.com',
          password:'password',
          password_confirmation:'password')
        
        authenticated_user = user.authenticate_with_credentials('JOHN@SMITH.COM', 'password')
        expect(authenticated_user).to eql(user)
      end

      it 'is valid when email has whitespace' do
        user = User.create(
          name:'John', 
          last_name:'Smith',
          email:'john@smith.com',
          password:'password',
          password_confirmation:'password')
        
        authenticated_user = user.authenticate_with_credentials(' john@smith.com ', 'password')
        expect(authenticated_user).to eql(user)
      end
    end
  end
end
