require 'rails_helper'

feature 'user can sign_up' do
  scenario 'successfully' do
    visit signup_path
    fill_in 'Email', with: 'david.ruizdelarosa@gmail.com'
    fill_in 'Name', with: 'David'
    fill_in 'Surname', with: 'Ruiz de la Rosa'
    fill_in 'Password', with: '918912178'
    fill_in 'Password confirmation', with: '918912178'
    click_on 'Sign Up'
    expect(page).to have_css '#user p', text: 'David'
    expect(page).to have_css '#user p', text: 'Ruiz de la Rosa'
    expect(page).to have_css '#user p', text: 'david.ruizdelarosa@gmail.com'
  end
end