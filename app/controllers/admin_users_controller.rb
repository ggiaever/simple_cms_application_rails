class AdminUsersController < ApplicationController

  layout 'admin'

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_users_params)
    if @admin_user.save
      flash[:notice] = "User #{@admin_user.name} created successfully!"
      redirect_to(admin_users_path)
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_users_params)
      flash[:notice] = "User #{@admin_user.name} edited successfully."
      redirect_to(admin_users_path)
    else
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = 'User deleted successfully.'
    redirect_to(admin_users_path)
  end

  private

  def admin_users_params
    params.require(:admin_user).permit(:username, :first_name, :last_name, :password, :email)
  end

end
