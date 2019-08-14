class Store < ApplicationRecord
  belongs_to :user
  attachment :item_image
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
