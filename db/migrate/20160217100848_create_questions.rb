class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title, null: false
      t.string :body, null: false
      t.integer :accepted_answer_id
      t.integer :view_count, default: 0
      t.timestamps null: false
    end
  end
end
