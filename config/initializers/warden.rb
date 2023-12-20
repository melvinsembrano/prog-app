class MagicLinkStrategy < Warden::Strategies::Base
  def request
    @request ||= ActionDispatch::Request.new(env)
  end

  def valid?
    request.params['gid'].present?
  end

  def authenticate!
    account = GlobalID::Locator.locate_signed(request.params['gid'])
    if account.present?
      success!(account)
    else
      fail!('Invalid magic link')
    end
  end
end

Warden::Strategies.add(:magic_link, MagicLinkStrategy)
