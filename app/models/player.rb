class Player < ApplicationRecord
    mount_uploader :image1, PlayerImgUploaderUploader
    mount_uploader :image2, PlayerImgUploaderUploader
    mount_uploader :image3, PlayerImgUploaderUploader
    mount_uploader :image4, PlayerImgUploaderUploader
    belongs_to :user
    has_many :posts, dependent: :destroy
    has_many :comments
    
    paginates_per 4
end
