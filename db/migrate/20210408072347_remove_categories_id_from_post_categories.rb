class RemoveCategoriesIdFromPostCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_categories, :category_id, :integer
  end
end
