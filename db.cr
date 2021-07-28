require "mysql"

def select_all_data
  books = [] of Hash(String, Int32|String)
  DB.open "mysql://new_app:mypassword@localhost/new_app" do |db|
    rs = db.query "select id, name from books"
    rs.each do
      books << {"id" => rs.read(Int32), "name" => rs.read(String)}
    end
  end
  books
end
