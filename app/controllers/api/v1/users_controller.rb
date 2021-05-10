class Api::V1::UsersController < ApiController
  def create
    @user = User.create(user_params)
    response_bad_request if !@user
    JwtAuth.tokenize(params[:user][:uid])
    response.set_header('Access-Token', token)
  end

  private

  def user_params
    params.permit(:uid, :name)
  end
end