require "kemal"


require "./src/macros/*"
require "./src/new_app.cr"

File.read_lines(".env").each do |line|
  key, value = line.strip.split "="
  ENV[key] = value
end
