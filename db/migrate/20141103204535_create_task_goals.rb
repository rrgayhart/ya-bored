class CreateTaskGoals < ActiveRecord::Migration
  def change
    create_table :task_goals do |t|
      t.integer :task_id
      t.integer :goal_id
      t.timestamps
    end
  end
end
