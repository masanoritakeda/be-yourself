class AddAddPostIdToPostCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :post_categories, :post_id, :integer
  end
end
