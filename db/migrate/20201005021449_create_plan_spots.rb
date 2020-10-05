class CreatePlanSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_spots do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
