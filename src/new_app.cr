require "./models/*"

get "/" do
  articles = Article.fetch_all
  view("site/index")
end

get "/new_page" do
  animal = "dog"
  view("site/test")
end
