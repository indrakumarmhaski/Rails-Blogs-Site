json.extract! blog, :id, :title, :description, :content, :thumbimg, :mainimg, :created_at, :updated_at
json.url blog_url(blog, format: :json)
