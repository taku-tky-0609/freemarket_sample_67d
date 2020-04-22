require 'rails_helper'

describe User do
  describe '#create' do
    context 'can save' do
      it "全てのバリデーションをクリアする場合は登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end
      
      it "self_introductionを入力していなくても登録できること" do
        user = build(:user)
        user = build(:user, self_introduction: "")
        expect(user).to be_valid
      end

      it "salesを入力していなくても登録できること" do
        user = build(:user)
        user = build(:user, sales: "")
        expect(user).to be_valid
      end

      it "pointを入力していなくても登録できること" do
        user = build(:user)
        user = build(:user, point: "")
        expect(user).to be_valid
      end

      it "iconを入力していなくても登録できること" do
        user = build(:user)
        user = build(:user, icon: "")
        expect(user).to be_valid
      end
      
      it "self_introduction,sales,point,iconを入力していなくても登録できること" do
        user = build(:user)
        user = build(:user, self_introduction: "", sales: "", point: "", icon: "")
        expect(user).to be_valid
      end
    end
    
    context 'can not save nil test' do
      it "nicknameがない場合は登録できないこと" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      
      it "emailがない場合は登録できないこと" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      
      it "last_nameがない場合は登録できないこと" do
        user = build(:user, last_name: "")
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end
      
      it "first_nameがない場合は登録できないこと" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end  

      it "last_name_kanaがない場合は登録できないこと" do
        user = build(:user, last_name_kana: "")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("can't be blank")
      end
        
      it "first_name_kanaがない場合は登録できないこと" do
        user = build(:user, first_name_kana: "")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end
        
      it "addressがない場合は登録できないこと" do
        user = build(:user, address: "")
        user.valid?
        expect(user.errors[:address]).to include("can't be blank")
      end
      
      it "phone_numberがない場合は登録できないこと" do
        user = build(:user, phone_number: "")
        user.valid?
        expect(user.errors[:phone_number]).to include("can't be blank")
      end
        
      it "passwordがない場合は登録できないこと" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
        
      it "reset_password_tokenがない場合は登録できないこと" do
        user = build(:user, reset_password_token: "")
        user.valid?
        expect(user.errors[:reset_password_token]).to include("can't be blank")
      end
      
      it "reset_password_sent_atがない場合は登録できないこと" do
        user = build(:user, reset_password_sent_at: "")
        user.valid?
        expect(user.errors[:reset_password_sent_at]).to include("can't be blank")
      end
      
      it "reset_password_sent_atがない場合は登録できないこと" do
        user = build(:user, reset_password_sent_at: "")
        user.valid?
        expect(user.errors[:reset_password_sent_at]).to include("can't be blank")
      end
      
      it " passwordが7文字以上であれば登録できること " do
        user = build(:user, password: "1234567", password_confirmation: "1234567")
        user.valid?
        expect(user).to be_valid
      end
  
      it " passwordが6文字以下であれば登録できないこと " do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
      end

    end
    
    context 'can not save unique test' do
      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to inclide("has already been taken")
      end

      it "重複したnicknameが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, nickname: user.nickname)
        another_user.valid?
        expect(another_user.errors[:nickname]).to inclide("has already been taken")
      end

      it "重複したphone_numberが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, phone_number: user.phone_number)
        another_user.valid?
        expect(another_user.errors[:phone_number]).to inclide("has already been taken")
      end

      it "重複したpasswordが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, password: user.password)
        another_user.valid?
        expect(another_user.errors[:password]).to inclide("has already been taken")
      end

      it "重複したreset_password_tokenが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, reset_password_token: user.reset_password_token)
        another_user.valid?
        expect(another_user.errors[:reset_password_token]).to inclide("has already been taken")
      end
    end
  end
end