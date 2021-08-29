class MessagesController < ApplicationController

  $chatMessage = []

  def index
    @recipientUser = User.find(params[:user_id])
    @messageCurrentUser = Message.where(sender_id: current_user, recipient_id: @recipientUser )
    @messageRecipientUser = Message.where(sender_id: @recipientUser, recipient_id: current_user)
    # $chatMessage.push(@messageCurrentUser)
    # $chatMessage.push(@messageRecipientUser)
    # @sort = $chatMessage.sort_by  { |obj| - obj['created_at'].to_i  }
  end

  def new

  end

  def create
    @message = current_user.sent_messages.new(messages_params)
    @message.recipient_id = User.find(params[:user_id]).id
    @message.save

    redirect_to user_messages_path
  end

  private

  def messages_params
    params.require(:message).permit(:content, :recipient_id, :sender_id)
  end

  def set_recipient
    @recipient = User.find(params[:user_id])
  end

end
