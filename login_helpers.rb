require 'twitch-api'

# First step: Get OAuth2 Authorization code
# Once you created a Twitch application you can call this method with your own client_id and client_secret
# to generate a link to authorize the script to access your Twitch account. After completing the process you will be
# redirected to a URL including the OAuth2 Authorization Code
def generate_login_link
  Twitch::Client.new(
    client_id: 'YOUR_CLIENT_ID',
    client_secret: 'YOUR_CLIENT_SECRET',
    scopes: ["channel:manage:broadcast"],
    token_type: :user
  )

rescue TwitchOAuth2::Error => e
  puts e.metadata[:link]
end

# Second step: Get OAuth2 Access and Refresh tokens
# With the Authorization code obtained in the previous step, you can get the access_token and the refresh_token
def get_auth_tokens(code)
  oauth_client = TwitchOAuth2::Client.new(
    client_id: 'YOUR_CLIENT_ID',
    client_secret: 'YOUR_CLIENT_SECRET',
    scopes: ["channel:manage:broadcast"]
  )

  puts oauth_client.token(token_type: :user, code: code)
end

# Third step: Get your user_id from your login name
def get_user_id(login)
  twitch_client = Twitch::Client.new(
    client_id: 'YOUR_CLIENT_ID',
    client_secret: 'YOUR_CLIENT_SECRET',
    access_token: 'YOUR_ACCESS_TOKEN',
    refresh_token: 'YOUR_REFRESH_TOKEN',
    scopes: ["channel:manage:broadcast"],
    token_type: :user
  )

  puts twitch_client.get_users(login: login)
end
