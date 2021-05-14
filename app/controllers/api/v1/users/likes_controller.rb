class Api::V1::Users::LikesController < ApiController
  def index
    user = User.find_by(id: params[:id])
    @likes = user.likes.all
  end

  def create
  end

  def destroy
  end
end