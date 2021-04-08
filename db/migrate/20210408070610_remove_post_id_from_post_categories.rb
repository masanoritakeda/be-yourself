class RemovePostIdFromPostCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_categories, :pos_id, :integer
  end
end
