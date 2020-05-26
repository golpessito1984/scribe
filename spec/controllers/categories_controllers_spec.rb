require 'rails_helper'

RSpec.describe CategoriesController , type: :controller do
  before(:each) do
    sign_in
    @category = FactoryBot.create(:category,
                                  title: 'Programming',
                                  order: 1)
  end

  describe 'Category GET #index' do
    before(:each) do
      @sub_category = FactoryBot.create(:category,
                                        title: 'Ruby',
                                        order:1)

      @sub_category2 = FactoryBot.create(:category,
                                         title: 'PHP',
                                         order: 2)

      @category.children << @sub_category
      @category.children << @sub_category2
    end

    it 'successfully' do
      get :index
      expect(response.status).to eq(200)
      expect(assigns(:categories)).to match_array([@category,
                                                             @sub_category,
                                                             @sub_category2])
      expect(response).to render_template("index")
    end
  end

  describe 'Category GET #show' do
    it 'successfully' do
      get :show, params: {id: @category.id}
      expect(response.status).to eq(200)
      expect(assigns(:category)).to eq(@category)
    end
  end

  describe 'Category POST #create' do
    it 'successfully' do
      category_params = { category: { title: 'Network',
                                      description: 'Network Description',
                                      parent_id: @category.id}}
      expect do
        post :create, params: category_params
      end.to change(Category, :count).by(1)
    end
  end

  describe 'Category PUT #update' do
    it 'successfully' do
      category_params = { title: @category.title + ' updated',
                          description: @category.description + ' updated' }
      category_title = @category.title
      category_description = @category.description
      put :update, params: {id: @category.id, category: category_params }
      expect(assigns(:category)).to eq(@category)
      @category.reload
      expect(@category.title).to eq(category_title + ' updated')
      expect(@category.description).to eq(category_description + ' updated')
    end
  end
end