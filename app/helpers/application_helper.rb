# frozen_string_literal: true

module ApplicationHelper
  def current_user
    super || ::Users::Guest.new
  end
end
