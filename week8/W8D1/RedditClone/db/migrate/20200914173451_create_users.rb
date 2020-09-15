class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null:false
      t.string :password, null:false
      t.boolean :status, null:false
      t.integer :reddit_id, null:false

      t.timestamps
    end

      add_index :users, :username
      add_index :users, :password, unique:true
  end
end
