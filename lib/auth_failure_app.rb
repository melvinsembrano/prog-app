require 'action_controller/metal'

class AuthFailureApp < ActionController::Metal
  include ActionController::Redirecting

  def self.call(*args)
  req = ActionDispatch::Request.new(*args)
  action(req.env['warden.options'][:action]).call(*args)
  end

  def unauthenticated
    if request.format == :json
      render json: { error: 'Unauthorized' }, status: :unauthorized
    else
      redirect_to '/login'
    end
  end

end
