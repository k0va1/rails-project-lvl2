# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts
  belongs_to :category, class_name: 'PostCategory', foreign_key: 'post_category_id', inverse_of: :posts
  has_many :comments, class_name: 'PostComment', inverse_of: :post, dependent: :destroy
  has_many :likes, class_name: 'PostLike', inverse_of: :post, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
