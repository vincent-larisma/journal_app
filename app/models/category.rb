class Category < ApplicationRecord
    has_many :tasks

    validates :category_title , presence: true
end
