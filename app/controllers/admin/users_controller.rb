module Admin
  class UsersController < AdminController
    layout 'admin/layout'

    before_action :signed_in_admin

    def index
      @users = User.all.order(:id)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params
      if @user.save
        redirect_to admin_users_path
      else
        redirect_to admin_users_new_path
      end
    end

    def toggle_admin
      @user = User.find params[:id]
      if @user.admin?
        @user.update_attribute :admin, false
      else
        @user.update_attribute :admin, true
      end
    end

    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
      end
  end
end