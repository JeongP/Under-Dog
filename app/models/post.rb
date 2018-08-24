class Post < ApplicationRecord
    mount_uploader :image, PostImgUploaderUploader
    mount_uploader :image2, PostImgUploaderUploader
    mount_uploader :image3, PostImgUploaderUploader
    mount_uploader :image4, PostImgUploaderUploader
    mount_uploader :image5, PostImgUploaderUploader
    
    belongs_to :user
    belongs_to :player
    # has_many :posts, dependent: :destroy
    has_many :biding_users, :through => :bidings, :source => :user
    
    paginates_per 4
end
