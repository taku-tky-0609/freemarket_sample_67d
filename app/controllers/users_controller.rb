class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
    @user.address.build
  end

  def create
    @user = User.new(user_params)
    binding.pry
    @user.save
    redirect_to users_path(@user)
  end

  def show
    @contents = ['お知らせ',"いいね一覧","出品する","下書き一覧","出品した商品–出品中","出品した商品–取引中","売却済み","購入した商品","評価一覧","売り上げ","ガイド","お問い合わせ"]
    @settings = ['プロフィール','発送元・お届け先住所変更','メール・パスワード','本人情報','電話番号の確認','ログアウト']
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, address_attributes:[:postal_code, :prefecture, :municipality, :house_number])
  end

end
