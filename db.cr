require "mysql"

def select_all_data
  books = [] of Hash(String, Int32|String)
  DB.open ENV["DB_STR"] do |db|
    rs = db.query "select id, title from books"
    rs.each do
      books << {"id" => rs.read(Int32), "name" => rs.read(String)}
    end
  end
  books
end
