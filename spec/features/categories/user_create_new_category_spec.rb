require 'rails_helper'

feature 'User create a new category' do
  scenario 'successfully' do
    category = create_category('Programming', 'Programming Description')
    expect(page).to have_css '.category p', text: 'Programming'
    expect(page).to have_css '.category p', text: 'Programming Description'
    expect(page).to have_css '.category p', text: category.parent.title
  end
end