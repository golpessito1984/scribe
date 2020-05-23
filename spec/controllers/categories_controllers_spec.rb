require 'rails_helper'

RSpec.describe CategoriesController , type: :controller do
  describe 'Category GET #index' do
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

    it 'successfully' do
      get :index
      expect(response.status).to eq(200)
      expect(assigns(:categories)).to match_array([@category,
                                                             @sub_category,
                                                             @sub_category2])
      expect(response).to render_template("index")
    end

  end
end