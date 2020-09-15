class Menu < ApplicationRecord
    validates :name, presence: true, uniqueness: true, lenght: { minimum: 2}  
    has_and_belongs_to_many :dish 
end
