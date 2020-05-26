module Controllers
  def sign_in
    user = FactoryBot.create(:user,
                             email: 'david.ruizdelarosa@gmail.com',
                             password: '918912178')

    session[:user_id] = user.id
  end
end

