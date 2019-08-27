class Users::StoresController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @enduser = current_user
    @search = Store.ransack(params[:q])
    @stores = @search.result.page(params[:page]).reverse_order.search(params[:search])

    respond_to do |format|
      format.html
      format.json { render json: @stores }
    end

  end

  def show
    @enduser = current_user
  	@store = Store.find_by(id: params[:id])
  end

  def new
    @enduser = current_user
  	@store = Store.new
    @store.store_images.build
  end

  def create
  	@store = Store.new(store_params)
    @store.user = current_user
  	if @store.save
  	   flash[:notice] = "memo完了！！"
  	   redirect_to users_store_path(@store)
  	else
  	   render :new
  	end
  end

  def edit
    @enduser = current_user
  	@store = Store.find_by(id: params[:id])
    @store.store_images.build
  end

  def update
  	@store = Store.find(params[:id])
    @store.user = current_user
  	if @store.update(store_params)
  	   flash[:notice] = "memo更新！！"
  	   redirect_to users_store_path(@store)
  	else
  	   render :edit
  	end
  end

  def destroy
      @store = Store.find(params[:id])
      @store.destroy
      redirect_to users_stores_path
  end

private

  def store_params
  	params.require(:store).permit(:latitude, :longitude, :store_name, :user_id, :favorite_id, :item_image, :price, :genre, :waittime, :taste, :appearance, :atmosphere, :release, :area, :station, :people_number, :store_address, :impression, store_images_item_images: [])
  end

  def correct_user
    store = Store.find(params[:id])
    if current_user.id != store.user.id
      redirect_to users_stores_path
    end
  end

end
