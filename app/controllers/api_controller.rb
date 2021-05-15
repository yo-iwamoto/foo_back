class ApiController < ActionController::API
  def response_success
    render status: 200, json: { status: 200, message: "Success" }
  end

  def response_bad_request(message)
    render status: 400, json: { status: 400, message: message }
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

  def verify_with_token
    token = request.headers['Access-Token']
    return unless token

    begin
      decoded_token = JwtAuth.decode(token)[0]
    rescue JWT::DecodeError
      response_unauthorized
    end

    return if decoded_token['exp'] < Time.now.to_i

    @user = User.find_by(uid: decoded_token['uid'])
  end
end