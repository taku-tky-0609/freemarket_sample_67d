require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:user) { create(:user) }
  describe 'GET #new' do 
    before do
      sign_in user
    end
    it "new.html.hamlに遷移すること" do
      # get :new, :format => "haml"

      # controller.prepend_view_path 'app/views'
      # controller.append_view_path 'app/views'
      get "/items/new"
      binding.pry
      expect(response).to render_template("items/new")
    end
  end
end
