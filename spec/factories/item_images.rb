FactoryBot.define do
  factory :item_image do
    src { File.open("#{Rails.root}/public/images/test_image.jpg") }
  end
end