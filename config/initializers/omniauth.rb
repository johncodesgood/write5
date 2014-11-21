Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '377195279107195', '5f507a2d6497290e97a6a3fddf9b70d1',
           :scope => 'email,user_birthday,read_stream'
end