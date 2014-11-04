class CreateTaskResources < ActiveRecord::Migration
  def change
    create_table :task_resources do |t|
      t.integer :task_id
      t.integer :resource_id
      t.timestamps
    end
  end
end
