class Api::V1::ShopsController < ApiController
  KEY = ENV['HOTPEPPER_API_KEY'].freeze
  URL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1?key=#{KEY}&format=json".freeze

  def index
    @result = ShopsHandler.getAPIResult(query_params, current_user)
  end

  private

  def query_params
    params.permit(:keyword, :lat, :lng, :range, :count, :id)
  end
end