require 'rails_helper'

# bundle exec rspec spec/controllers/items_controller_spec.rb

# describe ItemsController do
#   payjp_customer = double("Payjp::Customer")
#   allow(Payjp::Customer).to receive(:create).and_return(payjp_customer)
# end

RSpec.describe ItemsController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe 'GET #new' do 
    before do
      login_user user
      controller.append_view_path 'app/views'
    end
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template("items/index")
    end

    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template("items/new")
    end

    it "show.html.hamlに遷移すること" do
      get :show, params: { id: item.id }
      expect(response).to render_template("items/show/#{params.id}")
    end

  end
end