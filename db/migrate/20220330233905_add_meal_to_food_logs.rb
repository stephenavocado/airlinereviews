class AddMealToFoodLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :food_journals, :meal, :integer
  end
end
