module MessagesHelper
  def my_message_class(message)
    message.sender == current_user ? 'justify-content-between' : 'justify-content-start'
  end
end
