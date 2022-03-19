class AddPainAfterToPainJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :pain_journals, :pain_after, :string, array: true, default: []
  end
end
