class AddLackeysToUserQuest < ActiveRecord::Migration[5.1]
  def change
    add_column :user_quests, :lackeys, :integer, default: 0
  end
end
