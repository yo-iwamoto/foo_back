class Api::V1::Users::LikesController < ApiController
  before_action :verify_user, only: %i[index]

  def index
    @shops = current_user.liked_shops.all
  end

  def destroy
  end

  private

  def verify_user
    user = User.find_by!(uid: params[:user_uid])
    response_unauthorized unless current_user.id == user.id
  end
end