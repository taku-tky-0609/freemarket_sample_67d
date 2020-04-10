require 'rails_helper'

describe UsersController do
  describe 'GET #new' do 
    context '前提条件'
    it "new.html.erbに遷移すること" do
      get :new
    end
  end
end