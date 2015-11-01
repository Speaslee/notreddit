class CreateAddPostTables < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :owner
      t.timestamps null: false
    end

    create_table :comments do |t|
      t.string :subject
      t.text :body
      t.references :commentable, polymorphic: true, index: true
      t.timestamps null: false
  end

    create_table :votes do |t|
      t.integer :user_id
      t.boolean :status
      t.references :votable, polymorphic: true, index: true

    end
end
end
