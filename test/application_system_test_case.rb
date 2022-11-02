require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def login_as(user, password)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: password
    click_on 'Log in'
  end

  def show_task_index()
    visit root_url
    click_on "-SHOW", match: :first

    assert_text "Tasks"
  end
end
