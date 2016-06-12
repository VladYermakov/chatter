class UsersController < ApplicationController
  before_action :user_params, only: :create
  before_action :clear_cookies

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to Chat'
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
