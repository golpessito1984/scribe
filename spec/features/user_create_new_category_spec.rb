require 'rails_helper'

feature 'User create a new category' do
  scenario 'successfully' do
    visit root_path
    click_on 'Add a new category'
    fill_in "Title", with: 'Programming'
    fill_in "Description", with: 'Programming Description'
    click_on 'Submit'
    expect(page).to have_css '.category p', text: 'Programming'
  end
end