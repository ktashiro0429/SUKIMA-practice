class EntriesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index
    if params[:id]
      @user = User.find(params[:id])
      @entries = @user.entries.page(params[:page]).per(3)
    else
      @entries = Entry.all.page(params[:page]).per(3)
    end
    @entries = @entries.order("created_at DESC").page(params[:page]).per(3)
    @group = Group.new
    # @entries = @entries.readable_for(current_user).order(posted_at: :desc)#.paginate(page: params[:page], per_page: 5)
  end

  def show
    @entry = Entry.find(params[:id])
    # @entry = Entry.readable_for(current_user).find(params[:id])
    @group = Group.new(user_id: @entry.user_id)
  end

  def new
    @entry = Entry.new
  end

  def edit
    @entry = current_user.entries.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    # @entry.author = current_user
    if @entry.save
      redirect_to root_path, notice:"投稿を作成しました"
    else
      render "new"
    end
 end

  def update
    @entry = current_user.entries.find(params[:id])
    @entry.assign_attributes(entry_params)
    if @entry.save
      redirect_to @entry, notice:"投稿を更新しました"
    else
      render "edit"
    end
  end

   def destroy
    @entry = current_user.entries.find(params[:id])
      @entry.destroy
      redirect_to :entries, notice:"投稿を削除しました"
    end


  def search
    @entries = Entry.search(params[:q]).page(params[:page]).per(3)
    #@entries = @entries.order("created_at DESC")  
    render "index"
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :body, :job_category).merge(user_id: current_user.id)
    end

end
