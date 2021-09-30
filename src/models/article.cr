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

  def self.find(id)
    DB.open ENV["DB_STR"] do |db|
      rs = db.query "select id, title, content, img_url, created_at from articles where id = ?", id
      rs.each do
        return {
          "id" => rs.read(Int32),
          "title" => rs.read(String),
          "content" => rs.read(String),
          "img_url" => rs.read(String),
          "created_at" => rs.read(Time).as(Time).to_local.to_s("%F")
        }
      end
    end
  end

  def self.all_ids
    ids = [] of Int32
    DB.open ENV["CLEARDB_DATABASE_URL"] do |db|
      rs = db.query "select id from articles"
      rs.each do
        ids << rs.read(Int32)
      end
    end
    ids
  end
end
