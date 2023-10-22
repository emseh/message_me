# frozen_string_literal: true

# The MessagesController class handles the creation of messages, requiring a user to be logged in and
# saving the message if it is valid.
class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)

    return unless message.save

    ActionCable.server.broadcast 'chatroom_channel',
                                 mod_message: message_render(message)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end
