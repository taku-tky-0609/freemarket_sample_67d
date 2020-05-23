require 'rails_helper'

# bundle exec rspec spec/controllers/registrations_controller_spec.rb

describe Users::RegistrationsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    # ↑メモ　deviseのhelper methodが使えるようになる
    @user = create(:user)
  end
  describe 'GET #new' do 
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

end