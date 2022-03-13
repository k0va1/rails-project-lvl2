# frozen_string_literal: true

module Posts
  module CommentsHelper
    def nested_comments(post, comments)
      nested_comments_array = comments.map do |comment, sub_comments|
        render('posts/comments/nested_comment', comment:, post:) +
          content_tag(:div, nested_comments(post, sub_comments), class: 'ms-4')
      end
      safe_join(nested_comments_array)
    end

    def id_for_comment_form(post, parent_comment = nil)
      dom_id_for_records(post, parent_comment)
    end
  end
end
