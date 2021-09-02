class MessagesController < ApplicationController

  def index
    @recipient = User.find(params[:user_id])
    @message = Message.all
    @message_user = Message.where(sender_id: current_user.id, recipient_id: @recipient.id).order(created_at: :desc).reverse
    @message_recipient = @message.where(sender_id:@recipient.id,recipient_id: current_user.id).order(created_at: :desc).reverse




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
