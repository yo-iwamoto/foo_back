class Api::V1::Shops::LikesController < ApiController
  def create
    @user = current_user
    @shop = Shop.where(hotpepper_id: params[:shop_hotpepper_id]).first
    @shop ||= Shop.create(hotpepper_id: params[:shop_hotpepper_id])
    like = @user.likes.build(shop_id: @shop.id)
    begin
      if !like.save!
        response_bad_request(like.errors.messages)
      end
    rescue ActiveRecord::RecordNotUnique
    end
  end

  def destroy
    @user = current_user
    @shop = Shop.where(hotpepper_id: params[:shop_hotpepper_id]).first
    if @shop
      like = @user.likes.where(shop_id: @shop.id).first
      if like
        like.destroy
      end
    end
  end
end