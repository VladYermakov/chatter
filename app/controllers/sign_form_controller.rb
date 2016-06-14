class SignFormController < ApplicationController
  def sign_in
    respond_to do |format|
      format.js
      format.html { render root_path }
    end
  end

  def sign_up
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
