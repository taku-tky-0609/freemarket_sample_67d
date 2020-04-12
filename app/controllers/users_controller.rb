class UsersController < ApplicationController
  def index
  end

  def show
    @contents = ['お知らせ',"いいね一覧","出品する","下書き一覧","出品した商品–出品中","出品した商品–取引中","売却済み","購入した商品","評価一覧","売り上げ","ガイド","お問い合わせ"]
    @settings = ['プロフィール','発送元・お届け先住所変更','メール・パスワード','本人情報','電話番号の確認','ログアウト']
  end
end
