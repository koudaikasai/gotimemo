class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stores, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :user_image

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true

  def self.search(search)
    if search
      where(['nickname LIKE ?', "%#{search}%"])
    else
      all
    end
  end


end
