require 'rails_helper'

# bundle exec rspec spec/models/item_spec.rb

describe Item do
  describe '#create' do
    context 'can save' do
      it "全てのバリデーションをクリアする場合は登録できること" do
        item = build(:item)
        expect(item).to be_valid
      end
    end
    
    context 'can not save nil test' do
      it "item_nameがない場合は登録できないこと" do
        item = build(:item, item_name: "")
        item.valid?
        expect(item.errors[:item_name]).to include()
      end
      
      it "priceがない場合は登録できないこと" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include()
      end
      
      it "category_idがない場合は登録できないこと" do
        item = build(:item, category_id: "")
        item.valid?
        expect(item.errors[:category_id]).to include()
      end
      
      it "status_idがない場合は登録できないこと" do
        item = build(:item, status_id: "")
        item.valid?
        expect(item.errors[:status_id]).to include()
      end  

      it "sizeがない場合は登録できないこと" do
        item = build(:item, size: "")
        item.valid?
        expect(item.errors[:size]).to include()
      end
        
      it "delivery_method_idがない場合は登録できないこと" do
        item = build(:item, delivery_method_id: "")
        item.valid?
        expect(item.errors[:delivery_method_id]).to include()
      end
  
      it "delivery_fee_idがない場合は登録できないこと" do
        item = build(:item, delivery_fee_id: "")
        item.valid?
        expect(item.errors[:delivery_fee_id]).to include()
      end
        
      it "prefecture_idがない場合は登録できないこと" do
        item = build(:item, prefecture_id: "")
        item.valid?
        expect(item.errors[:prefecture_id]).to include()
      end

      it "estimated_delivery_idがない場合は登録できないこと" do
        item = build(:item, estimated_delivery_id: "")
        item.valid?
        expect(item.errors[:estimated_delivery_id]).to include()
      end
    end
  end
end