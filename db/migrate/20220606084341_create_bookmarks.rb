class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :end_user_id
      t.integer :question_id
      t.integer :post_id
      t.timestamps
    end
  end
end
