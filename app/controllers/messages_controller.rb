class MessagesController < ApplicationController
  before_action :signed_in_user

  def index
    unless params[:messages].nil?
      if params[:messages][:room] == 'Create room'
        room = Room.new
        room.save
      else
        room = Room.find params[:messages][:room]
      end
      cookies[:room] = room.id
    end
  end
end
