class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }

end
