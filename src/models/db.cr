require "mysql"

class Article
  def self.fetch_all
    articles = [] of Hash(String, Int32|String)
    DB.open ENV["DB_STR"] do |db|
      rs = db.query "select id, title from articles"
      rs.each do
        articles << {"id" => rs.read(Int32), "name" => rs.read(String)}
      end
    end
    articles
  end
end
