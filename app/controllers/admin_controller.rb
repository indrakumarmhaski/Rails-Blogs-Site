class AdminController < ApplicationController

  before_action :set_user,only:[:destroy]

  def index
    @users = User.all
  end

  def destroy
    if( @user.role == :admin)
        redirect_to admin_index_path, notice: "He is an admin, can't be deleted."
    else
        @user.destroy!
        redirect_to admin_index_path, notice: "User #{@user.name} was successfully deleted."
    end
  end

  private

  def set_user
    @user = User.find(params[:user])
  end

end
