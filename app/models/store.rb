class Store < ApplicationRecord

  enum genre: { 和食: 1, 洋食: 2, 西洋料理: 3, 中華料理: 4, "アジア・エスニック": 5, カレー: 6, 焼肉: 7, 鍋: 8, 居酒屋: 9, ダイニングバー: 10, 創作料理: 11, 無国籍料理: 12, ファミレス: 13, その他: 14 }
  enum waittime: { "15分未満": 1, "15分": 2, "30分": 3, "１時間": 4}
  enum release: { 公開: 1, 非公開: 2}
  enum area: { ff: 1, 非公開d: 2}
  enum people_number: { 公開s: 1, 非公開a: 2}
  enum price: { 公: 1, 非公a: 2}

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :store_images, dependent: :destroy
  attachment :item_image

  validates :store_name, presence: true
  validates :genre, presence: true
  validates :waittime, presence: true
  validates :release, presence: true
  validates :area, presence: true
  validates :taste, presence: true
  validates :appearance, presence: true
  validates :atmosphere, presence: true
  validates :user_id, presence: true


  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
		if search
			where(['store_name LIKE ?', "%#{search}%"])
		else
			all
		end
	end
end
