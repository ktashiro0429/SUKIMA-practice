class TopController < ApplicationController
    def index
    if params[:id]
    @user = User.find(params[:id])
    @entries = @user.entries
  else
    @entries = Entry.all
  end
    @entries = @entries.readable_for(current_user).order(posted_at: :desc)#.paginate(page: params[:page], per_page: 5)
  end
    
    @entry = @Entries.readable_for(current_user).find(params[:id])
    
end

