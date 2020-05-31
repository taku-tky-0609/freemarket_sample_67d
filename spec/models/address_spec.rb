require 'rails_helper'
describe Address do
  let(:user) { create(:user) }
  describe '#create' do
    context 'can save' do
      it "全てのバリデーションをクリアする場合は登録できること"  do
        user = build(:user)
        address = build(:address)
        expect(address).to be_valid
      end
    end
      
    context 'can not save' do
      it "user_idがない場合は登録できないこと" do
        address = build(:address, user_id: "")
        address.valid?
        expect(user.errors[:user_id]).to include()
      end
      
      it "postal_codeがない場合は登録できないこと" do
        address = build(:address, postal_code: "")
        address.valid?
        expect(address.errors[:postal_code]).to include("が入力されていません。", "のフォーマットが不適切です。記述例 000-0000")
      end
      
      it "prefecturesがない場合は登録できないこと" do
        address = build(:address, prefectures: "")
        address.valid?
        expect(address.errors[:prefectures]).to include("が入力されていません。")
      end
      
      it "municipalityがない場合は登録できないこと" do
        address = build(:address, municipality: "")
        address.valid?
        expect(address.errors[:municipality]).to include("が入力されていません。")
      end
    end
  end
end