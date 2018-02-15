class AddGodToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :god, :boolean, default: false
  end
end
