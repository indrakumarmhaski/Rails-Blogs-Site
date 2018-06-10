class Comment < ApplicationRecord
    belongs_to :blog
    belongs_to :user

    validates :comment, :user_id, :blog_id, presence: true

end
