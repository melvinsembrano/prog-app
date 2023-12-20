class ApplicationController < ActionController::Base
  include AuthHelper
  before_action :authenticate!

end
