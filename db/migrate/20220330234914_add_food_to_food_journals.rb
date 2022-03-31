class AddFoodToFoodJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :food_journals, :food, :string
  end
end
