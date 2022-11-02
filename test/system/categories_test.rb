require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do 
    @categories = categories(:one)
    @user = users(:test)
    login_as(@user, 'test@test.com')

  end
  
  test "visit index category" do
    visit categories_url
    assert_selector "h2", text: "Taskly, task for your dai-ly needs"
  end

  test "creating a new category" do
    visit root_url
    click_link "Create New Task Category!"

    fill_in "Category Title", with: "Random Title"
    fill_in "Category Detail", with: "Random Detail"
    click_on "Submit"

    assert_text "Category was successfully created"
    assert_text "Random Title"

  end

  test "showing a category" do
    visit root_url
    click_on "-SHOW", match: :first

    assert_text "Tasks"
    click_on "Home"

    assert_selector "h2", text: "Taskly, task for your dai-ly needs"
  end

  test "updating a Category" do
    visit root_url
    click_on "-EDIT", match: :first

    fill_in "Category title", with: "Random Title"
    fill_in "category_category_detail", with: "Random Detail"
    click_on "Submit"

    assert_text "Category was successfully updated"
    assert_text "Random Title"
  end

  test "destroy a category" do
    visit root_url
    page.accept_confirm do
      click_on "-DELETE", match: :first
    end
    assert_text "Category was successfully deleted"
  end

end
