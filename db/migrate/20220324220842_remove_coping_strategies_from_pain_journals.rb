class RemoveCopingStrategiesFromPainJournals < ActiveRecord::Migration[6.1]
  def change
    remove_column :pain_journals, :coping_strategies
  end
end
