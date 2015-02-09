class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    add_index :exercises, :name, unique: true
  end
end
