class Spot < ApplicationRecord
    has_many :plan_spots, dependent: :destroy
    has_many :plans, through: :plan_spots
end
