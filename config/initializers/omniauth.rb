OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY_FAILURE_RESUME'], ENV['TWITTER_SECRET_FAILURE_RESUME']
end