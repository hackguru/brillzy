Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '153778217969506', '3ec1704ae3e78e9244a681847e2c6304'
end
