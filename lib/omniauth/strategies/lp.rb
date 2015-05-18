require 'omniauth-oauth2'

module OmniAuth
    module Strategies
        class Lp < OmniAuth::Strategies::OAuth2
            # Give your strategy a name.
            option :name, "lp"

            # This is where you pass the options you would pass when
            # initializing your consumer from the OA  uth gem.
            option :client_options, {
                                      :site => "http://localhost:4000"
                                  }

            # These are called after authentication has succeeded. If
            # possible, you should try to set the UID without making
            # additional calls (if the user id is returned with the token
            # or as a URI parameter). This may not be possible with all
            # providers.

            uid do
                @raw_info['uid']
            end

            info do
                @raw_info
            end

            def raw_info
                @raw_info ||= access_token.get('/api/me.json').parsed
            end
        end
    end
end

