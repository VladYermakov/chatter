# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
# noinspection RubyResolve
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user, :room

  	def connect
			if cookies[:remember_token].nil? || cookies[:room].nil?
				reject_unauthorized_connection
			else
  	  	self.current_user, self.room = User.find_by(remember_token: User.encrypt(cookies[:remember_token])).original_name, cookies[:room]
			end
  	end
  end
end
