require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new
    end
  end
end