class RemovePopularityFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :popularity, :integer
  end
end
