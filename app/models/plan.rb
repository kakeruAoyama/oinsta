class Plan < ApplicationRecord
    has_many :plan_spots, dependent: :destroy
    has_many :spots, through: :plan_spots
  
end
