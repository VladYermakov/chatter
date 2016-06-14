# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user, :room

  	def connect
			self.current_user = User.find_by(remember_token: User.encrypt(cookies[:remember_token])).original_name
			self.room = cookies[:room]
  	end
	end
end
