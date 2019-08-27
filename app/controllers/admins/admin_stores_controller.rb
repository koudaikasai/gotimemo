class Admins::AdminStoresController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@search = Store.ransack(params[:q])
    @stores = @search.result.page(params[:page]).reverse_order.search(params[:search])

    respond_to do |format|
      format.html
      format.json { render json: @stores }
  end
  end

  def show
  	@store = Store.find_by(id: params[:id])
  end

  def destroy
  	@store = Store.find_by(id: params[:id])
  	@store.destroy
  	redirect_to admins_admin_stores_path
  end
end
