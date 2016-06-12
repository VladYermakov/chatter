class Message < ApplicationRecord

  validates :content, presence: true

  belongs_to :user
  belongs_to :room

  after_create_commit do
    MessageBroadcastJob.perform_now self.user.name, self.room_id, self.content
  end

end
