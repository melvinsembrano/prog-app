module AuthHelper
  extend ActiveSupport::Concern

  included do

    def warden
      request.env['warden']
    end

    def current_account
      warden.user
    end

    def authenticated?
      wardend.authenticated?
    end

    def authenticate!
      warden.authenticate!
    end

  end

end
