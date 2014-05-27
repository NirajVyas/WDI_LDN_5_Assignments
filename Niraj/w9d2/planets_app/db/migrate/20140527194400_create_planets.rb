class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :size
      t.string :distance

      t.timestamps
    end
  end
end
