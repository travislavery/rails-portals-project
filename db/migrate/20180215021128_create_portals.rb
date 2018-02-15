class CreatePortals < ActiveRecord::Migration[5.1]
  def change
    create_table :portals do |t|
      t.integer :god_id
      t.string :location

      t.timestamps
    end
  end
end
