class UsersController < ApplicationController
  before_action :user_params, only: :create

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
