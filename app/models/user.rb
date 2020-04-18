class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true
  has_many :items
  has_many :comments
  has_many :likes
  has_many :items_statuses
  has_one :credit_card
  has_one :address
  accepts_nested_attributes_for :address

  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい'}
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい'}
  validates :first_name, presence: true, length: { maximum: 35 }, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '日本語でお願いします please use Japanese characters'}
end
