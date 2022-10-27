class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :delete_all 

    validates :category_title , presence: true
end
