class SessionsController < ApplicationController
  before_action :signed_in_user, only: :destroy
  before_action :clear_cookies

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      redirect_to sign_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
