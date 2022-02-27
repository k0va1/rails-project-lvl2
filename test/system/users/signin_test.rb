# frozen_string_literal: true

require 'application_system_test_case'

module Users
  class SigninTest < ::ApplicationSystemTestCase
    test 'user signin' do
      User.create(email: 'test@test.ru', password: 123123123)

      visit new_user_session

      fill_in 'Email', with: 'test@test.ru'
      fill_in 'Password', with: '123123'

      click_on 'Log in'

      assert_text 'Выйти'
    end
  end
end
