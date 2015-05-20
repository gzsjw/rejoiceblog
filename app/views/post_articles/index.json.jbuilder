json.array!(@post_articles) do |post_article|
  json.extract! post_article, :id, :title, :nodes, :image, :category, :keywords
  json.url post_article_url(post_article, format: :json)
end
