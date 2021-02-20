class DropTablePhotoposts < ActiveRecord::Migration[5.2]
  def change
    drop_table :photoposts
  end
end
