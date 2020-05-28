require 'rails_helper'

# bundle exec rspec spec/controllers/items_controller_spec.rb

describe ItemsController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:item) { create(:item) }
  before do
    login_user user
  end 
  describe 'GET #new' do 
    it "new.html.hamlに遷移すること" do
      controller.append_view_path 'app/views'
      get :new
      expect(response).to render_template("items/new")
    end
  end
  describe 'POST #create' do 
    it "商品登録に成功した場合root_pathに遷移すること" do
      expect{
        post :create, item: attributes_for(:item, category_id: caregory.id )
      }.to change(Items, :count).by(1)
      expect(response).to render_template(root_path)
    end
  end
end