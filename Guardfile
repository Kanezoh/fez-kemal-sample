# Watches your main kemal app
guard "kemal", path: ".", file: "app.cr" do
  watch("src/new_app.cr")
  watch(%r{src/.*\.ecr})
end

# Watches your sass files
guard "sass", input: "src/assets/styles", output: "public/stylesheets", style: :compressed

# Watches your es6 files
watch(/src\/assets\/scripts\/.*\.es6$/) { `ruby es2js.rb` }
