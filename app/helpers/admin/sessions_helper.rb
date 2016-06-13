module Admin
  module SessionsHelper
    def sign_in_admin(user)
      remember_token = User.new_remember_token
      cookies[:admin_remember_token] = cookies[:remember_token] = remember_token
      user.update_attributes! admin_remember_token: User.encrypt(remember_token), remember_token: User.encrypt(remember_token)
      self.admin_user = user
    end

    def admin_user=(user)
      @admin_user = user
    end

    def admin_user
      admin_remember_token = User.encrypt(cookies[:admin_remember_token])
      @admin_user ||= User.remembered_by :admin, remember_token: admin_remember_token
    end

    def signed_in_admin?
      !cookies[:admin_remember_token].nil?
    end

    def sign_out_admin
      remember_token = User.new_remember_token
      admin_user.update_attributes admin_remember_token: User.encrypt(remember_token), remember_token: User.encrypt(remember_token)
      cookies.delete(:admin_remember_token)
      cookies.delete(:remember_token)
      self.admin_user = nil
    end

    def signed_in_admin
      unless signed_in_admin?
        redirect_to admin_index_path, alert: 'Please sign in.'
      end
    end
  end
end
