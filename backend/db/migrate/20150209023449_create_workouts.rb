class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    add_index :workouts, :name, unique: true
  end
end
