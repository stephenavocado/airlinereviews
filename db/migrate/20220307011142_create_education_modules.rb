class CreateEducationModules < ActiveRecord::Migration[6.1]
  def change
    create_table :education_modules do |t|
      t.integer :module_id
      t.integer :status, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
