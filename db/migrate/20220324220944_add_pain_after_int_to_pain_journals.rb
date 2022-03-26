class AddPainAfterIntToPainJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :pain_journals, :pain_after, :integer
  end
end
