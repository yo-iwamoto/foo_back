class JwtAuth
  ALG = 'HS256'.freeze
  if Rails.env === 'production'
    SECRET_KEY = ENV['SECRET_KEY']
  else
    SECRET_KEY = Rails.application.credentials.config[:secret_key_base]
  end
  EXPIRED_AFTER = 60 * 60 * 24 * 360

  def self.tokenize(uid)
    payload = {
      uid: uid,
      exp: Time.now.to_i + EXPIRED_AFTER 
    }
    JWT.encode(payload, SECRET_KEY, ALG)
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY, true, algorithm: ALG)
  end
end