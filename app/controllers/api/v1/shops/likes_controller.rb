class Api::V1::Shops::LikesController < ApiController
  def index
    @result = []
    ids = params[:ids]
    ids.each do |id|
      shop = Shop.where(hotpepper_id: id).first
      if shop
        @result.append(current_user.liked?(shop))
      else
        Shop.create()
      end
    end
  end

  def create
    shop = Shop.where(hotpepper_id: params[:hotpepper_id]).first
    shop = Shop.create(shop_params) unless shop
    like = current_user.likes.build(shop_id: shop.id)
    begin
      if like.save!
        @message = 'success'
        if current_user.likes.count == 1
          @message = 'first'
        end
      else
        response_bad_request(like.errors.messages)
      end
    rescue ActiveRecord::RecordNotUnique
      @message = 'already_liked'
    end
  end

  def destroy
    shop = Shop.where(hotpepper_id: params[:id]).first
    if shop
      like = current_user.likes.where(shop_id: shop.id).first
      like.destroy
      @message = 'success'
    else
      response_bad_request('fail')
    end
  end

  private

  def shop_params
    params.permit(:hotpepper_id)
  end
end