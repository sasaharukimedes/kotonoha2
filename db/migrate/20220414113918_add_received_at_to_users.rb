class AddReceivedAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :received_at, :datetime
  end
end
