require "./models/*"

get "/" do
  articles = Article.fetch_all
  view("articles/index")
end

get "/articles/:id" do |env|
  id = env.params.url["id"]
  article = Article.find(id)
  if article.nil?
    render_404
  else
    view("articles/show")
  end
end
