require 'rails_helper'

feature 'User update category' do
  scenario 'successfully' do
    parent_category = FactoryBot.create(:category, order: 1)
    category = FactoryBot.create(:category)
    category_title = category.title
    category_description = category.description

    visit edit_category_path(category)
    fill_in 'Title', with: category_title + ' Updated'
    fill_in 'Description', with: category_description + ' Updated'
    select(parent_category.title, from: 'Parent')
    click_on 'Submit'

    expect(page).to have_css '.category p', text: category_title + ' Updated'
    expect(page).to have_css '.category p', text: category_description + ' Updated'
    expect(page).to have_css '.category p', text: parent_category.title
  end
end