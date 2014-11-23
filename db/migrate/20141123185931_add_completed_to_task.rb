class AddCompletedToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :completed, :boolean, default: false, nil: false
  end
end
