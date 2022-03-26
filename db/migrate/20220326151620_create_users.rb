class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.string :uid
      t.integer :smart_goals_count
      t.integer :pain_journals_count
      t.integer :mood_journals_count
      t.integer :food_journals_count
      t.integer :education_modules_count
      t.integer :movement_modules_count
      t.integer :bookmarks_count

      t.timestamps
    end
  end
end
