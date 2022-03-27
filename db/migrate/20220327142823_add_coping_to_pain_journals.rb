class AddCopingToPainJournals < ActiveRecord::Migration[6.1]
  def change
    add_column :pain_journals, :coping, :string
  end
end
