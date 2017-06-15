class MessagesController < GroupsController

  before_action :set_message, except: [:index, :create, :show]

  def index
    @message = Message.new
    set_group_identification
  end

  def create
    Message.create(message_params)
    redirect_to action: 'index'
  end

  def edit
    set_group_identification
  end

  def update
    @message.update(message_params)
    redirect_to action: 'index'
  end

  def destroy
    if current_user.nil?
      if @message.admin_id == current_admin.id
        @message.destroy
      end
    else
      if @message.user_id == current_user.id
        @message.destroy
      end
    end
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

  def set_message
    @message = Message.find(params[:id])
  end

  def set_group_identification
    @group = Group.find(params[:group_id])
    if current_user.nil?
      @groups = Group.where(admin_id: current_admin.id)
    else
      @groups = Group.where(user_id: current_user.id)
    end
  end
end
