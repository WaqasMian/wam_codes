class Dish < ApplicationRecord
    has_and_belongs_to_many :menu
end
