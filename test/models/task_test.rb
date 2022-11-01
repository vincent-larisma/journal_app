require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "task title should not be empty" do
    task = Task.new(task_title: nil, task_detail: "random")
    assert_not task.save
  end

  test "task detail should not be empty" do
    task = Task.new(task_title: "random", task_detail: nil)
    assert_not task.save
  end
end
