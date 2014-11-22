# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, '377195279107195', '5f507a2d6497290e97a6a3fddf9b70d1',
#            :scope => 'email,read_stream,publish_stream,offline_access,manage_pages'
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], 
  {:scope => 'email,read_stream,publish_actions,offline_access,manage_pages,publish_stream'}
end