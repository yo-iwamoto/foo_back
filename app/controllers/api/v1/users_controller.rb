class Api::V1::UsersController < ApiController
  def create
    @user = User.create(user_params)
    response_bad_request if !@user
  end

  private

  def user_params
    params.require(:user).permit(:uid, :name)
  end
end