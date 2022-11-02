require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do 
    @task = tasks(:one)
    @user = users(:test)
    login_as(@user, 'test@test.com')
    show_task_index()
  end

  test "creating a new Task" do
    click_on "Add Task"

    fill_in "Task title", with: "Random Task Title"
    fill_in "Task detail", with: "Random Task Detail"
    fill_in "Due date", with: @task.due_date
    click_on "Submit"

    assert_text "Task was successfully created"
    assert_text "Random Task Title"
  end

  test "show a Task" do
    Capybara.page.find('.bi-eye').click

    assert_text "Detail:"
    assert_text "Deadline:"

    click_on "Back"

    assert_text "Tasks"
  end

  test "updating a Task" do
    Capybara.page.find('.bi-pencil-square').click

    fill_in "Task title", with: @task.task_title
    fill_in "Task detail", with: @task.task_detail
    fill_in "Due date", with: @task.due_date
    click_on "Edit"

    assert_text "Task was successfully updated"
    assert_text @task.task_title
  end

  test "destroy a Task" do
    page.accept_confirm do
      Capybara.page.find('.bi-trash3').click
    end
    assert_text "Task was successfully deleted"
  end
end
