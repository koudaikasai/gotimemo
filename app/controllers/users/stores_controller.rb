class Users::StoresController < ApplicationController
  def index
  	@stores = Store.page(params[:page]).reverse_order.search(params[:serch])
  end

  def show
  	@store = Store.find_by(id: params[:id])
  end

  def new
  	@store = Store.new
  end

  def create
  	@store = Store.new(store_params)
    @store.user = current_user
  	if @store.save!
  	   flash[:notice] = "memo完了！！"
  	   redirect_to users_stores_path
  	else
  	   render :new
  	end
  end

  def edit
  	@store = Store.find_by(id: params[:id])
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
  	params.require(:store).permit(:store_name, :user_id, :favorite_id, :item_image_id, :item_image, :price, :genre, :waittime, :taste, :appearance, :atmosphere, :release, :area, :station, :people_number, :store_address, :impression, store_images_item_images: [])
  end

end
