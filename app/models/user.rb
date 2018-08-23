class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :img, UserImgUploaderUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :player, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :coins, dependent: :destroy
  has_many :markets, dependent: :destroy
  has_many :biding_posts, :through => :bidings, :source => :posts
  
end
