class Addnametogoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :name, :string, null: false
  end
end
