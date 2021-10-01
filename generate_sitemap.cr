require "sitemapper"
require "./src/models/*"
require "./config.cr"

# Configure sitemapper
Sitemapper.configure do |c|
  c.storage = :aws
  c.host = "https://kanezoh.herokuapp.com"

  # This option is important!
  c.aws_config = {
    "region" => "us-east-2",
    "key" => ENV["AWS_ACCESS_KEY"],
    "secret" => ENV["AWS_SECRET_KEY"],
  }
  c.sitemap_host = "https://kanezoh-blog-bucket.s3.amazonaws.com"
end

# Use sitemapper
sitemaps = Sitemapper.build do
  add("/", changefreq: "always", priority: 0.1)
  Article.all_ids.each do |id|
    add("/articles/#{id}", changefreq: "always", priority: 0.9)
  end
end

# Just have Sitemapper write them out to your public/sitemaps folder
# This will create ./public/sitemaps/sitemap1.xml, etc...
Sitemapper.store(sitemaps, "kanezoh-blog-bucket/sitemaps")
