class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.text :task_detail
      t.datetime :due_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
