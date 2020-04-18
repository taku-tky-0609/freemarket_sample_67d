class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
    @user.address.build
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user)
  end

  def show
    @contents = []
    contents = [      "お知らせ",              "いいね一覧", "出品する","下書き一覧","出品した商品–出品中","出品した商品–取引中","売却済み","購入した商品","評価一覧","売り上げ","ガイド","お問い合わせ"]
    contents_links = [user_path(current_user), root_path, "",       "",        "",                "",                "",]
    contents.each.with_index(0) do |content,i|
      @contents << {content: content, link: contents_links[i]}
    end
    @settings = []
    settings = ["プロフィール","発送元・お届け先住所変更","メール・パスワード","本人情報","電話番号の確認","ログアウト"]
    settings_links = [ '#',"#","#","#","#",  destroy_user_session_path ]
    settings.each.with_index(0) do |setting, d|
      @settings << {content: setting, link: settings_links[d]}
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, address_attributes:[:postal_code, :prefecture, :municipality, :house_number])
  end

end
