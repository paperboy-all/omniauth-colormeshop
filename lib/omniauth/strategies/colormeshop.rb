require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class ColorMeShop < OmniAuth::Strategies::OAuth2
      option :name, 'colormeshop'
      option :client_options, {
        site:             'https://api.shop-pro.jp',
        authorize_url:    'https://api.shop-pro.jp/oauth/authorize',
        access_token_url: 'https://api.shop-pro.jp/oauth/token',
      }

      uid      { raw_info['shop']['id'] }
      info     { { name: raw_info['shop']['login_id'] } }
      extra    { { raw_info: raw_info } }

      def raw_info
        @raw_info ||= access_token.get('/v1/shop.json').parsed
      end
    end
  end
end
