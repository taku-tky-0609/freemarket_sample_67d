class User < ApplicationRecord

  enum prefectures:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
    沖縄県:47,ラフテル:48
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true
  has_many :items
  has_many :comments
  has_many :likes
  has_many :items_statuses
  has_one :credit
  has_one :address
  accepts_nested_attributes_for :address
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'の入力はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'の入力はカタカナで入力して下さい。'}
  validates :last_name, presence: true, length: { maximum: 35 }, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "の入力は日本語でお願いします。"}
  validates :first_name, presence: true, length: { maximum: 35 }, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'の入力は日本語でお願いします。'}
  validates :phone_number, presence: true, length: { in: 10..12  }, format: { with: /\A\d{10,11}\z/, message: '10-11桁でハイフン（-）を入れないで下さい。'}
  # validates :birthday, presence: true, format: { with: /\A(19[0-9]{2}|20[0-9]{2})\/([1-9])|(0[0-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])\z/, message: 'は年/月/日で入力して下さい。 例 1999/02/31'}
end
