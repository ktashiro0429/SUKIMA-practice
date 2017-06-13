class GroupsController < ApplicationController

  def index
    if current_user.nil?
      @groups = Group.where(admin_id: current_admin.id)
    else
      @groups = Group.where(user_id: current_user.id)
    end
  end

end
