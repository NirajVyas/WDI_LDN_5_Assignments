class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :plot
      t.text :review

      t.timestamps
    end
  end
end
