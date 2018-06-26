class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :artist
      t.string :title

      t.timestamps null: false
    end
  end
end
