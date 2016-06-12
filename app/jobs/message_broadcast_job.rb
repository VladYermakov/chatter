class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user_name, room_id, content, *args)

    ActionCable.server.broadcast "messages_room_#{room_id}",
                       message: render_message(user_name, content)

  end

  private

    def render_message(username, content)
      ApplicationController.render(
          partial: 'messages/message',
          locals: {
              message: content,
              username: username
          })
    end

end
