# require 'google/api_client'
# require 'trollop'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'rubygems'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'
require 'json'

class YoutubeSearch

  def initialize
    initialize_call
  end

  private
# Sample Ruby code for user authorization

  # REPLACE WITH VALID REDIRECT_URI FOR YOUR CLIENT
  REDIRECT_URI = 'http://localhost'
  APPLICATION_NAME = 'YouTube Data API Ruby Tests'

  # REPLACE WITH NAME/LOCATION OF YOUR client_secrets.json FILE
  p CLIENT_SECRETS_PATH = File.join(__dir__,'client_secret.json')

  # REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
  p CREDENTIALS_PATH = File.join(__dir__,'credentials','credentials.yaml')

  # SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
  SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_READONLY



  def authorize
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(
      client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: REDIRECT_URI)
      puts "Open the following URL in the browser and enter the " +
           "resulting code after authorization"
      puts url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: REDIRECT_URI)
    end
    credentials
  end

  def initialize_call
    # Initialize the API
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.client_options.application_name = 'YouTube Data API Ruby Tests'
    service.authorization = authorize
  end

end
