class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
    	t.integer :user_id, foreign_key: true
      t.integer :likes_count
    	t.integer :category_id, foreign_key: true
      t.text :title
      t.text :content
      t.float :rate
      t.text :image_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
