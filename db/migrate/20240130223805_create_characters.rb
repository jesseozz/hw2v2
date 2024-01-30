class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string "name"
      t.string "actor_id"
      t.string "movie_id"
      t.timestamps
    end
  end
end
