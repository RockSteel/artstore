class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all
  end

  def to_admin
    User.find(params[:id]).to_admin
    redirect_to admin_users_path
  end

  def to_normal
    User.find(params[:id]).to_normal
    redirect_to admin_users_path
  end
end
