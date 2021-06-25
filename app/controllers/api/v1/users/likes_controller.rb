class Api::V1::Users::LikesController < ApiController
  before_action :verify_user, only: %i[index]

  def index
    id = []
    if current_user.liked_shops.empty?
      render status: 204, json: { status: 204, message: "no shops found" }
    else
      current_user.liked_shops.each do |shop|
        id.push(shop[:hotpepper_id])
      end
      @result = ShopsHandler.getAPIResult({ id: id.join(',') }, current_user)
    end
  end

  private

  def verify_user
    user = User.find_by!(uid: params[:user_uid])
    response_unauthorized unless current_user[:id] == user[:id]
  end
end