class Api::V1::Shops::ReportsController < ApiController
  def create
    current_user = User.first
    shop = Shop.where(hotpepper_id: params[:shop_hotpepper_id]).first || Shop.create(hotpepper_id: params[:shop_hotpepper_id])
    begin
      return unless current_user.reports.create(shop_id: shop[:id])

      response_bad_request(like.errors.messages)
    rescue ActiveRecord::RecordNotUnique
    end
    result = ShopsHandler.getAPIResult({ id: shop[:hotpepper_id] }, current_user)
    @shop = result[:shop][0]
  end

  def destroy
    begin
      shop = Shop.find_by!(hotpepper_id: params[:shop_hotpepper_id])
    rescue ActiveRecord::RecordNotFound
      response_bad_request('record not found')
    end
    if shop & shop.isReportedBy(current_user)
      shop.reports.where(user_id: current_user[:id]).destroy
    end
    result = ShopsHandler.getAPIResult({ id: shop[:hotpepper_id] }, current_user)
    @shop = result[:shop][0]
  end
end