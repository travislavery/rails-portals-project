class AddKarmaToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :karma, :integer, default: 0
  end
end
