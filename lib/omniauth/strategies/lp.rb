require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Lp < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "lp"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OA  uth gem.
      option :client_options, {
                                :site => "http://localhost:4000", # TODO paramaterize this
                                :authorize_url => '/oauth/authorize'
                            }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['id'] }

      info do
        {
            :email => raw_info['email']
        }
      end


      extra do
        {
            'raw_info' => raw_info
        }
      end

      def raw_info
        # TODO need to actually implement this servcice in LP
        # Need to also add teacher_id, class_id, school_id and anything else we need post login.
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end

