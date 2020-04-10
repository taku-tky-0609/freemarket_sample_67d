require 'rails_helper'
describe User do
  describe '#create' do
    it "全てのバリデーションをクリアする場合は登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end