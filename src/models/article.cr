require "mysql"

class Article
  def self.fetch_all
    articles = [] of Hash(String, Int32|String)
    DB.open ENV["DB_STR"] do |db|
      rs = db.query "select id, title, content_summary, img_url, created_at from articles"
      rs.each do
        articles << {
          "id" => rs.read(Int32),
          "title" => rs.read(String),
          "content_summary" => rs.read(String),
          "img_url" => rs.read(String),
          "created_at" => rs.read(Time).as(Time).to_local.to_s("%F")
        }
      end
    end
    articles
  end
end
