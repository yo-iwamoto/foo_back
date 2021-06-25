class Api::V1::Shops::LikesController < ApiController
  def create
    shop = Shop.where(hotpepper_id: params[:shop_hotpepper_id]).first || Shop.create(hotpepper_id: params[:shop_hotpepper_id])
    begin
      shop.likes.create(user_id: current_user.id)
    rescue ActiveRecord::RecordNotUnique
    end
    result = ShopsHandler.getAPIResult({ id: shop.hotpepper_id }, current_user)
    @shop = result[:shop][0]
  end

  def destroy
    begin
      shop = Shop.find_by!(hotpepper_id: params[:shop_hotpepper_id])
    rescue ActiveRecord::RecordNotFound
      response_bad_request('record not found')
    end
    if !!shop & shop.isLikedBy(current_user)
      shop.likes.find_by!(user_id: current_user[:id]).destroy
    end
    result = ShopsHandler.getAPIResult({ id: shop[:hotpepper_id] }, current_user)
    @shop = result[:shop][0]
  end
end