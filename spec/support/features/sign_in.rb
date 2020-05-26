module Features
  def sign_in
    user = FactoryBot.create(:user,
                             email: 'david.ruizdelarosa@gmail.com',
                             password: '918912178')
    visit root_path
    fill_in 'Email', with: 'david.ruizdelarosa@gmail.com'
    fill_in 'Password', with: '918912178'
    click_on 'Sign in'
  end
end