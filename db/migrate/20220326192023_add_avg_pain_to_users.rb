class AddAvgPainToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avg_pain_pre_start, :integer
  end
end
