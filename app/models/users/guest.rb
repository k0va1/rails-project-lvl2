# frozen_string_literal: true

module Users
  class Guest < ::User
    def logged_in?
      false
    end

    def post_likes
      []
    end
  end
end
