class AddProgramPaceGoalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :program_pace_goal, :integer, default: 0
  end
end
