class RemoveCopingStratsFromPainJournals < ActiveRecord::Migration[6.1]
  def change
    remove_column :pain_journals, :coping_strategies
    remove_column :pain_journals, :coping
  end
end
