class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks

    validates :category_title , presence: true
end
