class Api::V1::SessionsController < ApiController
  def create
    begin
      @user = User.find_by!(uid: params[:uid])
    rescue ActiveRecord::RecordNotFound
      @user = User.create(user_params)
    end
    response_bad_request(@user.errors.message) if !@user
    token = JwtAuth.tokenize(params[:uid])
    response.set_header('Access-Token', token)
  end

  private

  def user_params
    params.permit(:uid, :name)
  end
end