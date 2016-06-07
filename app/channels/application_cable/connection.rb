# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
# noinspection RubyResolve
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user, :room

  	def connect
  	  self.current_user, self.room = cookies.signed[:username], cookies.signed[:room]
  	end
  end
end
