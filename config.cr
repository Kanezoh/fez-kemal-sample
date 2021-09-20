require "kemal"


require "./src/macros/*"
require "./src/new_app.cr"

if File.exists?(".env")
  File.read_lines(".env").each do |line|
    key, value = line.strip.split "="
    ENV[key] = value
  end
end
