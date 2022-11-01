require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do 
    @categories = categories(:one)
    @user = users(:test)
  end

  test "visit index category" do
    login_as(@user, 'test@test.com')
    visit root_path
    assert_selector "h2", text: "Taskly, task for your dai-ly needs"
  end
  
  test "creating a new category" do
    visit root_path
    click_on "Create New Task Category!"

    fill_in "Category Title", with: "Random Title"
    fill_in "Category Detail", with: "Random Detail"
    click_on "Submit"

    assert_text "Category was successfully created"
    assert_text "Random Title"

  end

end
