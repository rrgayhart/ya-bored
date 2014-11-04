class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :site
      t.text :description
      t.integer :minutes, :default => 15
      t.timestamps
    end
  end
end
