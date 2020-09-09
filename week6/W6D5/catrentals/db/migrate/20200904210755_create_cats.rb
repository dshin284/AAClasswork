class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date :birth_date
      t.string :color
      t.string :name
      t.string  :sex, :limit =>1      
      #other option: , {limit: 1}
      t.text :description
      t.timestamps
    end
  end
end
