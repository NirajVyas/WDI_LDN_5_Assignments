class DropTableMovies < ActiveRecord::Migration
  def change
  	drop_table :movies
  end
end
