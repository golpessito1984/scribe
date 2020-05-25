module Features
  def create_category(title, description, parent_category)
    visit root_path
    click_on 'Add a new category'
    fill_in 'Title', with: title
    select(parent_category.title, from: 'Parent')
    fill_in 'Description', with: description
    click_on 'Submit'
  end
end