class Article < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :text,:title ,presence: true
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
