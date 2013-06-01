require 'rubygems'
require 'google/api_client'
require 'debugger'

require 'yaml'

# globals
# CLIENT_ID = '436815569780.apps.googleusercontent.com'
# CLIENT_SECRET = 'JgCzST8OZwPZGH2exxQqypQ1'
# YOUR_REDIRECT_URI = 'https://localhost/oauth2callback'
# SCOPE = 'https://www.googleapis.com/auth/calendar.readonly'

#oauth_yaml = YAML.load_file('.google-api.yaml')
client = Google::APIClient.new
client.authorization.client_id = CLIENT_ID_FROM_API_CONSOLE
client.authorization.client_secret = CLIENT_SECRET
client.authorization.scope = SCOPE

if client.authorization.refresh_token && client.authorization.expired?
  client.authorization.fetch_access_token!
end

service = client.discovered_api('calendar', 'v3')



# # Initialize the client & Google+ API
# client = Google::APIClient.new
# service = client.discovered_api('calendar', 'v3')

# # Initialize OAuth 2.0 client    
# client.authorization.client_id = CLIENT_ID_FROM_API_CONSOLE
# client.authorization.client_secret = CLIENT_SECRET
# client.authorization.redirect_uri = YOUR_REDIRECT_URI

# client.authorization.scope = 'https://www.googleapis.com/auth/calendar.readonly'

# # Request authorization
# redirect_uri = client.authorization.authorization_uri

# # Wait for authorization code then exchange for token
# client.authorization.code = '....'
# client.authorization.fetch_access_token!

debugger

# Make an API call
result = client.execute(
  :api_method => service.activities.list,
  :parameters => {'collection' => 'public', 'userId' => 'me'}
)

debugger

puts result.data