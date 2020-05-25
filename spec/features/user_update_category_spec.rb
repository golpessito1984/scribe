require 'rails_helper'

feature 'User update category' do
  scenario 'successfully' do
    parent_category = FactoryBot.create(:category, order: 1)
    parent_category_2 = FactoryBot.create(:category, order: 1)
    create_category('Programming', 'Programming Description', parent_category)
    #Update the new Category
    visit categories_path
    category_id = Category.last.id
    within("#category_#{category_id}") do
      click_link("Edit")
    end
    fill_in 'Title', with: 'Programming Updated'
    fill_in 'Description', with: 'Programming Description Updated'
    select(parent_category_2.title, from: 'Parent')
    click_on 'Submit'

    expect(page).to have_css '.category p', text: 'Programming Updated'
    expect(page).to have_css '.category p', text: 'Programming Description Updated'
    expect(page).to have_css '.category p', text: parent_category_2.title
  end
end