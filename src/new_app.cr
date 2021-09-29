require "./models/*"

get "/" do
  title = "哲学と技術の次元"
  articles = Article.fetch_all
  view("articles/index")
end

get "/articles/:id" do |env|
  id = env.params.url["id"]
  article = Article.find(id)
  if article.nil?
    render_404
  else
    title = "哲学と技術の次元 | #{article["title"]}"
    view("articles/show")
  end
end
