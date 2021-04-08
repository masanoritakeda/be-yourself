class AddPostIdToPostcategories < ActiveRecord::Migration[5.2]
  def change
    add_column :post_categories, :pos_id, :integer
    add_column :post_categories, :category_id, :integer
  end
end
