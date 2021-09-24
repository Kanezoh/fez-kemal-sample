require "./models/*"

get "/" do
  articles = Article.fetch_all
  view("articles/index")
end

get "/articles/:id" do
  animal = "dog"
  view("articles/show")
end
