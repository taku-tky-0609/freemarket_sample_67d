FactoryBot.define do
  factory :item_image do
    item_id {1}
    src { File.open("#{Rails.root}/public/images/test_image.jpg") }
  end
end