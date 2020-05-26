require 'rails_helper'

feature 'User visit homepage' do
  scenario 'successfully' do
    sign_in
    expect(page).to have_css 'h1', text: 'Scribe'
  end
end