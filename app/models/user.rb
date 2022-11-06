class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable, :timeoutable, :trackable

  attribute :received_at, :datetime, default: -> { Time.now }

  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :birthday, presence: true
  validates :received_at, presence: true


  #アクティブで自分からの通知パッシブは他人から
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
end
