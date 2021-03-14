class Deadline < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 10 }  
    validates :date, presence: true
end
