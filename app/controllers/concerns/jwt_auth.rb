class JwtAuth
  ALG = 'HS256'.freeze
  SECRET_KEY = 'auth:' + Rails.application.credentials.config[:secret_key_base]
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