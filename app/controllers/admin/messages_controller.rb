module Admin
  class MessagesController < AdminController
    layout 'admin/layout'

    before_action :signed_in_admin

    def index
      @messages = Message.all
    end
  end
end