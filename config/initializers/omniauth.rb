Rails.application.config.middleware.use OmniAuth::Builder do
  # Secrets for testing localhost
  CLIENT_ID = '436815569780-64n4601k4s6bm2s2e8vchvc6olvkp75k.apps.googleusercontent.com'
  CLIENT_SECRET = 'hWPj5SdhwCGxtQugL5bZRi7T'

  # Secrets for productions
  # CLIENT_ID = '436815569780.apps.googleusercontent.com'
  # CLIENT_SECRET = 'JgCzST8OZwPZGH2exxQqypQ1'

  scopes = [
      # we need the profile scope in order to login
      "https://www.googleapis.com/auth/userinfo.profile",
      "https://www.googleapis.com/auth/userinfo.email",
      # this and other scopes could be added, but match them up with the
      # features you requested in your API Console
      "https://www.googleapis.com/auth/calendar"
    ]
  provider :google_oauth2, CLIENT_ID, CLIENT_SECRET,
           {:scope =>scopes.join(" "), 
           	access_type: 'offline', 
           	redirect_uri:'http://www.peptalk.io/auth/google_oauth2/callback'}
end
