class Address < ApplicationRecord
  belongs_to :user
  validates :postal_code, presence: true, length: { maximum: 8 }, format: { with: /\A\d{3}-\d{4}\z/i, message: 'のフォーマットが不適切です。記述例 000-0000'}
end
