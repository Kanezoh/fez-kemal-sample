require "../db"

get "/" do
  #books = select_all_data
  books = [] of String
  view("site/index")
end

get "/new_page" do
  animal = "dog"
  view("site/test")
end
