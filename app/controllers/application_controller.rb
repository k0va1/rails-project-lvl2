# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user
    super || ::Users::Guest.new
  end
end
