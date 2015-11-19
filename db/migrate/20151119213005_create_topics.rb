class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
    end
    add_column :posts, :topic_id, :integer

  end
end
