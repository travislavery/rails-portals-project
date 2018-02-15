class AlterGodNameOnPortals < ActiveRecord::Migration[5.1]
  def change
  	rename_column :portals, :god_id, :user_id
  end
end
