class Dish < ApplicationRecord
    validates :name, presence: true
    validates :price, numericality: { only_integer: true}
    validates :visits, numericality: { only_integer: true}
    has_and_belongs_to_many :menu
end
