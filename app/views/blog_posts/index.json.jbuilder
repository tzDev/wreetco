json.array!(@blog_posts) do |blog_post|
  json.extract! blog_post, :id, :title, :posted_date, :author, :body, :tags, :project, :published
  json.url blog_post_url(blog_post, format: :json)
end
