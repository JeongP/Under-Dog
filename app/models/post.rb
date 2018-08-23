class Post < ApplicationRecord
    mount_uploader :image, PostImgUploaderUploader
    belongs_to :user
    belongs_to :player
    # has_many :posts, dependent: :destroy
    has_many :biding_users, :through => :bidings, :source => :user
    
    paginates_per 4
end
