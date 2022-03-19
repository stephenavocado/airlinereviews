class CreatePainJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :pain_journals do |t|
      t.integer :pain_score
      t.integer :user_id
      t.string :pain_setting
      t.string :pain_feeling
      t.string :who_with
      t.string :coping_strategies
      t.string :other_notes
      t.integer :pain_after_episode

      t.timestamps
    end
  end
end
