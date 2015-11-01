class AddNameColumn2 < ActiveRecord::Migration
  def change
      add_column :posts, :user_id, :integer
      remove_column :posts, :owner
  end
end
