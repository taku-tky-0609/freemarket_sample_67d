class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :likes
  has_many :items_statuses
  has_one :credit_card
  has_many :addresses
  accepts_nested_attributes_for :addresses

end