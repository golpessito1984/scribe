module Features
  def create_category(title, description)
    #1º Sign in
    sign_in
    parent_category = FactoryBot.create(:category, order: 1)
    #visit root_path
    click_on 'Add a new category'
    fill_in 'Title', with: title
    select(parent_category.title, from: 'Parent')
    fill_in 'Description', with: description
    click_on 'Submit'
    Category.last
  end
end