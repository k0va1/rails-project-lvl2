# frozen_string_literal: true

class PostCategory < ApplicationRecord
  belongs_to :post
end
