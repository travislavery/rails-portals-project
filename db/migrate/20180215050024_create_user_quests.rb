class CreateUserQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_quests do |t|
      t.integer :user_id
      t.integer :quest_id

      t.timestamps
    end
  end
end
