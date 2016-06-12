# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
# noinspection RubyResolve
class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from "messages_room_#{room}"
  end

  def speak(data)
    user = User.find_by original_name: current_user
    message = Message.new user: user, room_id: room, content: data['message']
    message.save!
  end

end
