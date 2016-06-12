module Admin
  class SessionsController < AdminController
    layout 'admin/layout'

    before_action :signed_in_admin, only: :destroy

    def create
      user = User.find_by(name: params[:admin_session][:name].downcase, admin: true)
      if user && user.authenticate(params[:admin_session][:password])
        sign_in_admin user
        redirect_to admin_index_path
      else
        redirect_to admin_index_path, notice: 'Invalid username/password'
      end
    end

    def destroy
      sign_out_admin
      redirect_to root_path
    end
  end
end
