class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.sender_id = current_user.id
    message.save!
    @new_message = Message.new(receipient_id: message.receipient_id)
  end

  private

  def message_params
    params.require(:message).permit(:body, :receipient_id)
  end
end
