class Api::V1::SessionsController < ApiController
  def create
    @user = User.find_by!(uid: params[:uid])
    response_bad_request(@user.errors.message) unless @user
    token = JwtAuth.tokenize(params[:uid])
    response.set_header('Access-Token', token)
  end
end