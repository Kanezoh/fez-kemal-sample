require "mysql"

class Article
  def self.fetch_all
    articles = [] of Hash(String, Int32|String)
    DB.open ENV["DB_STR"] do |db|
      rs = db.query "select id, title, content_summary from articles"
      rs.each do
        articles << {"id" => rs.read(Int32), "title" => rs.read(String), "content_summary" => rs.read(String)}
      end
    end
    articles
  end
end
