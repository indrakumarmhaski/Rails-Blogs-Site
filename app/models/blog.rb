class Blog < ApplicationRecord
    belongs_to :user
    has_many :comments,dependent: :destroy
    
    mount_uploader :thumbimg, BlogimagesUploader 
    mount_uploader :mainimg, BlogimagesUploader 

end
