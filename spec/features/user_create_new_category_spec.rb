require 'rails_helper'

feature 'User create a new category' do
  scenario 'successfully' do
    parent_category = FactoryBot.create(:category,
                                        order: 1)

    visit root_path
    click_on 'Add a new category'
    fill_in 'Title', with: 'Programming'
    select(parent_category.title, from: 'Parent')
    fill_in 'Description', with: 'Programming Description'
    click_on 'Submit'

    expect(page).to have_css '.category p', text: 'Programming'
    expect(page).to have_css '.category p', text: 'Programming Description'
    expect(page).to have_css '.category p', text: parent_category.title
  end
end