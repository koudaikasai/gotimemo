class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @endusers = User.page(params[:page]).reverse_order.search(params[:search])
  end

  def show
    @enduser = User.find(params[:id])
    @stores = Store.page(params[:page]).reverse_order.search(params[:search])
    @store = @enduser.stores.page(params[:page]).reverse_order.search(params[:search])
    @favorites = Store.joins(:favorites).select('stores.*,favorite_id,favorites.user_id').order('favorite_id desc').limit(10000).page(params[:page]).reverse_order.search(params[:search])
  end

  def destroy
    @enduser = User.find(params[:id])
    @enduser.destroy
    redirect_to admins_users_path
  end
end
