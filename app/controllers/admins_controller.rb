class AdminsController < ApplicationController

  def index
     @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    set_admin
  end

  def update
    set_admin
    if @admin.update(admin_params)
      redirect_to admin_path(current_admin), notice: '編集完了しました。'
    else
      redirect_to edit_admin_path(current_admin), alert: '保存されませんでした。'
    end
  end

  private
  def set_admin
    @admin = Admin.find(current_admin.id)
  end

  def admin_params
    params.require(:admin).permit(:image, :name, :about, :web, :address, :industry, :sns)
  end
end
