require 'twitch-api'

CLIENT_ID = ''
CLIENT_SECRET = ''
ACCESS_TOKEN = ''
REFRESH_TOKEN = ''
USER_ID =

def twitch_client
  Twitch::Client.new(
    client_id: CLIENT_ID,
    client_secret: CLIENT_SECRET,
    access_token: ACCESS_TOKEN,
    refresh_token: REFRESH_TOKEN,
    scopes: ["channel:manage:broadcast"],
    token_type: :user
  )
end

twitch_client.create_stream_marker(user_id: USER_ID)