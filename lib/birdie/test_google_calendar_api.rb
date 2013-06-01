require 'rubygems'
require 'google/api_client'
require 'debugger'

# globals
CLIENT_ID_FROM_API_CONSOLE = '436815569780.apps.googleusercontent.com'
CLIENT_SECRET = 'JgCzST8OZwPZGH2exxQqypQ1'
YOUR_REDIRECT_URI = 'https://localhost/oauth2callback'

# Initialize the client & Google+ API
client = Google::APIClient.new
service = client.discovered_api('calendar', 'v3')

# Initialize OAuth 2.0 client    
client.authorization.client_id = CLIENT_ID_FROM_API_CONSOLE
client.authorization.client_secret = CLIENT_SECRET
client.authorization.redirect_uri = YOUR_REDIRECT_URI

client.authorization.scope = 'https://www.googleapis.com/auth/calendar.readonly'

# Request authorization
redirect_uri = client.authorization.authorization_uri

# Wait for authorization code then exchange for token
client.authorization.code = '....'
client.authorization.fetch_access_token!

# Make an API call
result = client.execute(
  :api_method => service.activities.list,
  :parameters => {'collection' => 'public', 'userId' => 'me'}
)

debugger

puts result.data