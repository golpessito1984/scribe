require 'rails_helper'

feature 'User update category' do
  scenario 'successfully' do
    new_parent_category = FactoryBot.create(:category, order: 1)
    #spec/support/features/user_create_new_category
    category = create_category('Programming', 'Programming Description')
    #Update the new Category
    visit categories_path
    within("#category_#{category.id}") do
      click_link("Edit")
    end

    fill_in 'Title', with: 'Programming Updated'
    fill_in 'Description', with: 'Programming Description Updated'
    select(new_parent_category.title, from: 'Parent')
    click_on 'Submit'

    expect(page).to have_css '.category p', text: 'Programming Updated'
    expect(page).to have_css '.category p', text: 'Programming Description Updated'
    expect(page).to have_css '.category p', text: category.title
  end
end