class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
    	t.integer :user_id, foreign_key: true
    	t.integer :post_id, foreign_key: true
    	t.datetime :deleted_at
      t.timestamps
    end
  end
end
