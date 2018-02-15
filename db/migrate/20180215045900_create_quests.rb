class CreateQuests < ActiveRecord::Migration[5.1]
  def change
    create_table :quests do |t|
      t.string :title
      t.integer :priority
      t.integer :karma_impact, default: 0
      t.boolean :completed, default: false
      t.integer :portal_id

      t.timestamps
    end
  end
end
