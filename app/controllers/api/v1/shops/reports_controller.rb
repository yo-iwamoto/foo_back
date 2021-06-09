class Api::V1::Shops::ReportsController < ApiController
  def create
    @user = current_user
    @shop = Shop.where(hotpepper_id: params[:shop_hotpepper_id]).first
    @shop ||= Shop.create(hotpepper_id: params[:shop_hotpepper_id])
    report = @user.reports.build(shop_id: @shop.id)
    begin
      if !report.save!
        response_bad_request(report.errors.messages)
      end
    rescue ActiveRecord::RecordNotUnique
    end
  end

  def destroy
    @user = current_user
    @shop = Shop.where(hotpepper_id: params[:shop_hotpepper_id]).first
    if @shop
      report = @user.reports.where(shop_id: @shop.id).first
      if report
        report.destroy
      end
    end
  end
end