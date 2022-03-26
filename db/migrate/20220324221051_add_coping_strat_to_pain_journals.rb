class AddCopingStratToPainJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :pain_journals, :coping_strategies, :string, array: true, default: []
  end
end
