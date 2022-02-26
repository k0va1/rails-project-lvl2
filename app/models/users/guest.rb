# frozen_string_literal: true

module Users
  class Guest
    def logged_in?
      false
    end
  end
end
