require "sitemapper"
require "./src/models/*"
require "./config.cr"

# Configure sitemapper
Sitemapper.configure do |c|
  c.host = "https://kanezoh.herokuapp.com"
  c.compress = false
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
Sitemapper.store(sitemaps, "./public/")
