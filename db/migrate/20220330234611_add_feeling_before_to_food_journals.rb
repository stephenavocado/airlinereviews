class AddFeelingBeforeToFoodJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :food_journals, :feeling_before, :integer
    add_column :food_journals, :feeling_after, :integer
  end
end
