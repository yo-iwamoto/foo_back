class Api::V1::Users::ReportsController < ApiController
  before_action :verify_user, only: %i[index]

  def index
    id = []
    current_user.reported_shops.each_with_index do |shop, index|
      break if index == 20
      id.push(shop[:hotpepper_id])
    end
    @result = ShopsHandler.getAPIResult({ id: id }, current_user)
  end

  private

  def verify_user
    user = User.find_by!(uid: params[:user_uid])
    response_unauthorized unless current_user[:id] == user[:id]
  end
end