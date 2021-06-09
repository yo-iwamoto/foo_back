class Api::V1::ShopsController < ApiController
  def index
    @user = current_user
    ids = params[:ids]
    @shops = Shop.where(hotpepper_id: ids)
  end

  def show
    @user = current_user
    @shop = Shop.find_by(hotpepper_id: params[:hotpepper_id])
  end
end