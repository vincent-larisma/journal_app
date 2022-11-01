require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "category title should not be empty" do
    category = Category.new(category_title: nil, category_detail: "random")
    assert_not category.save
  end
end
