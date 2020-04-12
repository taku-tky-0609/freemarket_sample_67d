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
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, address_attributes:[:postal_code, :prefecture, :municipality, :house_number])
  end

end
