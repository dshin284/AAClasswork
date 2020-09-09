class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.integer :image_url, null:false
      t.integer :artist_id, null:false
      t.timestamps
    end

    add_index :artworks, :artist_id
  end
end
