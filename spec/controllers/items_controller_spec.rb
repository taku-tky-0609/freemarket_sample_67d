require 'rails_helper'

describe ItemsController, type: :controller do
  render_views
  let!(:user) { create(:user) }
  subject { item.user }
  # @user = {:user}
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
end