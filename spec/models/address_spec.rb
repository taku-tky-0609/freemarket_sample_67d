require 'rails_helper'
describe User do
  describe '#create' do
    context 'can save' do
      it "全てのバリデーションをクリアする場合は登録できること" do
        user = build(:address)
        expect(user).to be_valid
      end
    end
      
    context 'can not save' do
      it "user_idがない場合は登録できないこと" do
        user = build(:address, user_id: "")
        user.valid?
        expect(user.errors[:user_id]).to include("can't be blank")
      end
      
      it "postal_codeがない場合は登録できないこと" do
        user = build(:address, postal_code: "")
        user.valid?
        expect(user.errors[:postal_code]).to include("can't be blank")
      end
      
      it "prefecturesがない場合は登録できないこと" do
        user = build(:address, prefectures: "")
        user.valid?
        expect(user.errors[:prefectures]).to include("can't be blank")
      end
      
      it "municipalityがない場合は登録できないこと" do
        user = build(:address, municipality: "")
        user.valid?
        expect(user.errors[:municipality]).to include("can't be blank")
      end

      it "buildingがない場合は登録できないこと" do
        user = build(:address, building: "")
        user.valid?
        expect(user.errors[:building]).to include("can't be blank")
      end
    end
  end
end