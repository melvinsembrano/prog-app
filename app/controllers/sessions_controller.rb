class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new]

  def new
  end
end
