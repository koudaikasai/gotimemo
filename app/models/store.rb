class Store < ApplicationRecord

  before_save :geocode

  enum genre: { 和食:1, 洋食:2, 西洋料理:3, 中華料理:4, "アジア・エスニック":5, カレー:6, 焼肉:7, 鍋:8, 居酒屋:9, ダイニングバー:10, 創作料理:11, 無国籍料理:12, ファミレス:13, デザート:14, その他:15 }
  enum waittime: { "15分未満":1, "15分～30分":2, "30分～1時間":3, "1時間～2時間":4, "2時間～":5}
  enum release: { 公開: 1, 非公開: 2}
  enum area: { 北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
               茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
               新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
               岐阜県:21,静岡県:22,愛知県:23,三重県:24,
               滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
               鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
               徳島県:36,香川県:37,愛媛県:38,高知県:39,
               福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47}
  enum people_number: { "1人":1, "2人":2, "3人":3, "4人":4, "5人":5, "5人～10人":6, "10人～":7}
  enum price: { "～￥999円":1, "￥1,000～￥1,999":2, "￥2,000～￥2,999円":3, "￥3,000～￥3,999円":4, "￥4,000～￥4,999円":5, "￥5,000～￥5,999円":6, "￥6,000～￥6,999円":7, "￥7,000～￥7,999円":8, "￥8,000～￥8,999円":9, "￥9,000～￥9,999円":10, "￥10,000～円":11}

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :store_images, dependent: :destroy
  accepts_attachments_for :store_images, attachment: :item_image

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

  private
  def geocode
  if store_address.blank?
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.area.gsub(" ", "")+"&key=AIzaSyBAYMMRcT8tguqip4asNNbAk-txb_O6OJk")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]

  else
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.store_address.gsub(" ", "")+"&key=AIzaSyBAYMMRcT8tguqip4asNNbAk-txb_O6OJk")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end
  end

end
