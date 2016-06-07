class SessionsController < ApplicationController
  def create
  	cookies.signed[:username] = params[:session][:username]
    cookies.signed[:room]     = params[:session][:room]
  	redirect_to messages_path
  end
end
