class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :key_name, null: false
      t.string :description
      t.string :dod
      t.timestamps
    end
  end
end
