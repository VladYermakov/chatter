# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
# noinspection RubyResolve
class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from "messages_room_#{room}"
  end

  def speak(data)
    ActionCable.server.broadcast "messages_room_#{room}",
                message: render_message(data['message'])
  end

  private

    def render_message(message)
      ApplicationController.render(
      	partial: 'messages/message',
        locals: {
            message: message,
            username: current_user
        })
    end

end
