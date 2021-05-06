class ApiController < ActionController::API
  def response_success
    render status: 200, json: { status: 200, message: "Success" }
  end

  def response_bad_request
    render status: 400, json: { status: 400, message: 'Bad Request' }
  end

  def response_unauthorized
    render status: 401, json: { status: 401, message: 'Unauthorized' }
  end

  def response_not_found
    render status: 404, json: { status: 404, message: "Not Found" }
  end

  def response_conflict
    render status: 409, json: { status: 409, message: "Conflict" }
  end

  def response_internal_server_error
    render status: 500, json: { status: 500, message: 'Internal Server Error' }
  end

  # def authenticate_user?
  #   response_bad_request unless request.headers['Access-Token']
  # end

  # def current_user
  #   User.find_by!(id: decode_access_token[0]['uid'])
  # end

  # def correct_community_center?(community_center)
  #   current_user.community_center == community_center
  # end

  # private

  #   def decode_access_token
  #     hmac_secret = ENV['SECRET_KEY']
  #     token = request.headers['Access-Token']
  #     JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
  #   end

end