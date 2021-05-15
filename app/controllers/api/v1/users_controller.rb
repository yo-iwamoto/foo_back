class Api::V1::UsersController < ApiController

  def show
    @user = User.find(params[:id])
  end
  
  def create
    begin
      @user = User.create(user_params)
    rescue ActiveRecord::RecordNotUnique
      @user = User.find_by(uid: params[:uid])
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