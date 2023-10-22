# frozen_string_literal: true

# The ChatroomChannel class is a Ruby class that defines the behavior for subscribing and
# unsubscribing from a chatroom channel in an application.
class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chatroom_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
