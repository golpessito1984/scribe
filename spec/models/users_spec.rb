require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'David',
                     surname: 'Ruiz de la Rosa',
                     email: 'david.ruizdelarosa@gmail.com',
                     password: '918912178')
  end
  context 'with valid name, surname, email and password' do
    it 'successfully' do
      expect(@user).to be_valid
    end
    it 'respond successfully to password' do
      expect(@user.password.present?).to eq(true)
    end
  end

  context 'with invalid name, surname, email or password' do
    it 'not successfully with wrong email format' do
      @user.email = 'david.ruizdelarosa'
      expect(@user).to_not be_valid
    end

    it 'not successfully with duplicated email' do
      @user2 = FactoryBot.create(:user,
                                 email: 'david.ruizdelarosa@gmail.com')
      expect(@user).to_not be_valid
    end

    it 'not successfully with nil email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'not successfully with nil name' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'not successfully if password lesser than 8 digits' do
      @user.password = '222333'
      expect(@user).not_to be_valid
    end
  end
end