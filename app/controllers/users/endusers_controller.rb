class Users::EndusersController < ApplicationController
  def show
    @enduser = User.find(params[:id])
    @stores = Store.page(params[:page]).reverse_order.search(params[:serch])
    @store = current_user.stores.page(params[:page]).reverse_order.search(params[:serch])
    @favorites = Store.joins(:favorites).select('stores.*,favorite_id').order('favorite_id desc').limit(10000).page(params[:page]).reverse_order.search(params[:serch])
  end

  def edit
  	@enduser = User.find(params[:id])
  end

  def update
  	@enduser = User.find(params[:id])
    @enduser.update(enduser_params)
    redirect_to users_enduser_path(@enduser)
  end

  def destroy
  end


private

  def enduser_params
    params.require(:user).permit(:email, :first_name, :last_name, :last_name_kana, :first_name_kana, :nickname, :user_image, :user_image_id)
  end
end
