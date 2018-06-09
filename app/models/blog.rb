class Blog < ApplicationRecord
    belongs_to :user
    mount_uploader :thumbimg, BlogimagesUploader 
    mount_uploader :mainimg, BlogimagesUploader 

end
