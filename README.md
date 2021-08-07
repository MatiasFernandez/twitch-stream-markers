# Twitch Stream Marker script

This is a simple script to create a twitch stream marker from the command line (you need to have Ruby installed)

## Getting Twitch API credentials

Twitch official docs about API authentication: https://dev.twitch.tv/docs/authentication

You can use the helper methods included in `login_helpers.rb` to make the process a bit easier

## Usage

1. Fill-in the Auth details and your user id inside `create_stream_marker.rb` file

2. Execute this script from a terminal:

```
bundle exec ruby create_stream_marker.rb
```