class RemovePainAfterFromPainJournals < ActiveRecord::Migration[6.1]
  def change
    remove_column :pain_journals, :pain_after
  end
end
