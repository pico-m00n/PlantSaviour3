class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :end_user_id
      t.integer :question_id
      t.text :body
      t.timestamps
    end
  end
end
