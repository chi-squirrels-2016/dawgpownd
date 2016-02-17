class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voteable_type
      t.integer :voteable_id
      t.integer :user_id, null: false
      t.integer :value
      t.timestamps null: false
    end
  end
end
