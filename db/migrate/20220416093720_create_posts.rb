class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :dear
      t.text :content
      t.string :from
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :user_id

      t.timestamps
    end
  end
end
