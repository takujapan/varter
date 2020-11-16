class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :popularity
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :items, [:user_id, :created_at]
  end
end
