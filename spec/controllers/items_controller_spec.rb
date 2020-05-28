require 'rails_helper'

describe ItemsController, type: :controller do
  render_views
  let(:user) { create(:user) }
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
        item_params = FactoryBot.attributes_for(:item)
        post :create, params: { item: item_params }
      }.to change(Item, :count).by(1)
      expect(response).to render_template(root_path)
    end
  end
end