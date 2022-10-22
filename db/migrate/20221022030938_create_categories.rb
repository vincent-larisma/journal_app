class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :category_title
      t.text :category_detail

      t.timestamps
    end
  end
end
