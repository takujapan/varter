class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :name
      t.integer :item_id

      t.timestamps
    end
    add_index :keywords, :item_id
  end
end
