require "xml"
require "./models/*"

get "/" do
  title = "かねぞうドロップ"
  articles = Article.fetch_all
  ogp_str = ogp_tag("", title, "思考を整理するためのブログ、技術記事と雑記", "https://res.cloudinary.com/dhn2agtz0/image/upload/v1633181396/home_slrrxz.jpg")
  view("articles/index")
end

get "/articles/:id" do |env|
  id = env.params.url["id"]
  article = Article.find(id)
  if article.nil?
    render_404
  else
    title = "#{article["title"]} | かねぞうドロップ"
    ogp_str = ogp_tag("articles/#{id}", title, article["content_summary"], article["img_url"])
    view("articles/show")
  end
end

get "/sitemap" do |env|
  env.redirect "https://kanezoh-blog-bucket.s3.us-east-2.amazonaws.com/sitemaps/sitemap.xml"
end

def ogp_tag(path, title, content_summary, img_url)
  type = path == "" ? "blog" : "article"
  <<-EOS
  <meta property="og:url" content="/#{path}" />
  <meta property="og:type" content="#{type}" />
  <meta property="og:title" content="#{title}" />
  <meta property="og:description" content="#{content_summary}" />
  <meta property="og:site_name" content="かねぞうドロップ" />
  <meta property="og:image" content="#{img_url}" />
  EOS
end
