class Task < ApplicationRecord
  belongs_to :category

  validates :task_title, :task_detail , presence: true
  # validates :completed, inclusion: [true, false]

end
