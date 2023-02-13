class AddSomeArchivesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :sender_archives, :boolean, null:false, default:false
    add_column :posts, :receiver_archives, :boolean, null:false, default:false
    add_column :replies, :sender_archives, :boolean, null:false, default:false
    add_column :replies, :receiver_archives, :boolean, null:false, default:false
  end
end
