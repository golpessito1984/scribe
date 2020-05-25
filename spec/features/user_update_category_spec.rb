require 'rails_helper'

feature 'User update category' do
  scenario 'successfully' do
    category = FactoryBot.create(:category)
    category_title = category.title
    category_description = category.description
    visit edit_category_path(category)
    fill_in 'Title', with: category_title + ' Updated'
    fill_in 'Description', with: category_description + ' Updated'
    click_on 'Submit'
    expect(page).to have_css '.category p', text: category_title + ' Updated'
  end
end