class MessagesController < GroupsController

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
    if current_user.nil?
      @groups = Group.where(admin_id: current_admin.id)
    else
      @groups = Group.where(user_id: current_user.id)
    end
  end

  def create
    Message.create(message_params)
    redirect_to action: 'index'
  end

  private
  def message_params
    message = params.require(:message).permit(:message).merge(group_id: params[:group_id])

    if current_user.nil?
      message.merge(admin_id: current_admin.id)
    else
      message.merge(user_id: current_user.id)
    end
  end
end
