class GroupsController < ApplicationController

  def index
    if current_user.nil?
      @groups = Group.where(admin_id: current_admin.id)
    else
      @groups = Group.where(user_id: current_user.id)
    end
  end

  def create
    @a_group = Group.new(group_params)
    @group = Group.where(admin_id: @a_group.admin_id).where(user_id: @a_group.user_id).first_or_create
    redirect_to group_messages_path(@group)
  end

private
  def group_params
    params.require(:group).permit(:user_id).merge(admin_id: current_admin.id)
  end

end
