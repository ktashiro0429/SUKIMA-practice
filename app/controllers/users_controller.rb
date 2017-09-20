class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: '編集完了しました。'
    else
      redirect_to edit_user_path(current_user), alert: '保存されませんでした。'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:image, :name, :gender, :education, :atschool, :introduce, :address)
  end
end
