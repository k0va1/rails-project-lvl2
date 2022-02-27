# frozen_string_literal: true

require 'application_system_test_case'

module Posts
  class CreatePostTest < ::ApplicationSystemTestCase
    test 'creating post' do
      user = User.create(email: 'test@test.ru', password: 123_123_123)
      sign_in(user)

      visit new_post_path

      fill_in 'Title', with: Faker::Lorem.sentence
      fill_in 'Body', with: Faker::Lorem.paragraph
      fill_in 'Post category', with: PostCategory.find_by!(name: 'ruby')

      click_on 'Log in'

      assert_text 'Выйти'
    end
  end
end
