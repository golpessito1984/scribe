require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'with correct title, order' do
    it 'create successfully' do
      category = Category.new(title: 'Programming',
                              description: 'Programming Description',
                              order: 2)

      expect(category).to be_valid
    end
  end

  context 'with incorrect attributes' do
    before(:each) do
      @category = Category.new(title: 'Database')
    end
    it 'title to nil' do
      @category.title = nil
      expect(@category).not_to be_valid
    end

    it 'order to string' do
      @category.order = 'two'
      expect(@category).not_to be_valid
    end

    it 'order negative number' do
      @category.order = -2
      expect(@category).not_to be_valid
    end
  end

  context 'with subcategories' do
    before(:each) do
      @category = FactoryBot.create(:category,
                                    title: 'Programming',
                                    order: 1)

      @sub_category = FactoryBot.create(:category,
                                        title: 'Ruby',
                                        order:1)

      @sub_category2 = FactoryBot.create(:category,
                                         title: 'PHP',
                                         order: 2)

      @category.children << @sub_category
      @category.children << @sub_category2
    end

    it 'show children correctly' do
      expect(@category.children.count).to eq(2)
      expect(@category.children).to match_array([@sub_category, @sub_category2])
      expect(@sub_category.parent).to eq(@category)
      expect(@sub_category2.parent).to eq(@category)
    end

    it 'root does not parent' do
      expect(@category.parent_title).to eq(nil)
    end

    it 'root does not parent' do
      expect(@sub_category.parent_title).to eq('Programming')
    end

    it 'root has not parent' do
      expect(@category.has_parent?).to eq(false)
    end

    it 'maybe has children' do
      expect(@category.has_children?).to eq(true)
    end

    it 'leaf has not children' do
      expect(@sub_category.has_children?).to eq(false)
    end
  end
end