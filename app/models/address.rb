class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :prefectures, :postal_code, presence: true
end
