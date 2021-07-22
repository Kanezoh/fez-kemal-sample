get "/" do
  view("site/index")
end

get "/new_page" do
  animal = "dog"
  view("site/test")
end
