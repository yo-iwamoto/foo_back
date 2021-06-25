require 'net/http'
require 'json'
require 'uri'

class ShopsHandler
  KEY = ENV['HOTPEPPER_API_KEY'].freeze
  URL = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1?key=#{KEY}&format=json".freeze

  def self.getAPIResult(params, user)
    url = URL
    params.each do |key, value|
      url += "&#{key}=#{value}"
    end
    url = URI.parse(URI.encode(url))
    res = JSON.load(Net::HTTP.get(url)).deep_symbolize_keys
    res[:results][:shop].each do |shop|
      record = Shop.where(hotpepper_id: shop[:id])
      next if record.empty?

      record = record.first
      if (user)
        shop[:foo] = record.isReportedBy(user)
        shop[:liked] = record.isLikedBy(user)
      end
      shop[:foo_count] = record.reports.count
      shop[:likes_count] = record.likes.count
    end
    return res[:results]
  end
end