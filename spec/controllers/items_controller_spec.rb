require 'rails_helper'

describe ItemsController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:category) { create(:category) }
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
    subject {
      post :create,
      params: { item: attributes_for(:item).merge(
        {category_id: category.id, item_images_attributes:{"0":{src:Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.jpg'))}}}
        ) }
    }
    it "createすること" do
      expect{ subject }.to change{ Item.count }.by(1)
    end
  end
end