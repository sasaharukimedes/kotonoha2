class Post < ApplicationRecord
  #belongs_to :user , optional: true
  has_one :reply, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :receiver, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  #optionalは後々ユーザー2人以上でテストできるようになったら消す


  validates :dear, presence: true,
                    length: {maximum:25}
  validates :content, presence: true,
                      length: {maximum:200}
  validates :from, presence: true,
                    length:{maximum:25}
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :sender_archives, inclusion: {in: [true, false]}
  validates :receiver_archives, inclusion: {in: [true, false]}


  #いったんこっちでやる
  def create_notification_by(current_user)
    notification=current_user.active_notifications.new(
      post_id:self.id,
      visited_id: self.receiver_id,
      action:"post"
    )
    notification.save!
  end

end
