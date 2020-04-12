require 'rails_helper'

describe UsersController do
  describe 'GET #new' do 
    it "new.html.erbに遷移すること" do
      get :new
      expext(response).to render_template :new
    end
  end

  describe 'GET #edit' do 
    it "edit.html.erbに遷移すること" do
      get :edit
      expext(response).to render_template :edit
    end
  end

end