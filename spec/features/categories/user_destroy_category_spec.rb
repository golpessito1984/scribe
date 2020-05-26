require 'rails_helper'

feature 'user can destroy a category' do
  scenario 'successfully' do
    #1º Create category
    category = create_category('Programming', 'Programming Description')
    visit categories_path
    within("#category_#{category.id}") do
      click_on "Delete"
    end
    expect(page).not_to have_css "#category_#{category.id}"
  end
end