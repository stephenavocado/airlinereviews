class AddCopingArrayToPainJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :pain_journals, :coping_array, :string, array: true, default: []
  end
end
