require 'application_system_test_case'

module Users
  class SignupTest < ::ApplicationSystemTestCase
    test "new user signup" do
      visit new_user_registration_path

      fill_in 'Email', with: 'test@test.ru'
      fill_in 'Password', with: '123123'
      fill_in 'Password confirmation', with: '123123'

      click_on 'Sign up'

      assert_text 'Выйти'
    end
  end
end
