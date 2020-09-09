class CreateArtworkshare < ActiveRecord::Migration[5.2]
  def change
    create_table :artworkshares do |t|
      t.integer :artwork_id, null:false
      t.integer :viewer_id, null:false
    end
  end
end
