class PagesController < ApplicationController
  def about

  end

  def homepage
    @user = current_user
  end

  def mymessage
    @message = Message.all
    @user = User.all
    @array = []
    @my_dialog = []
    @message.each do |msg|
      @array.push( msg.sender_id)
    end
    @array = @array.to_set
    @array.each do |arr|
      if arr != current_user.id
        @my_dialog.push(arr)
      end
    end
  end

end
