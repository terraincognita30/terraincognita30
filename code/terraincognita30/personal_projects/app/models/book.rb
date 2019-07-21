require 'sqlite3'

class Book
  attr_accessor :id, :title, :author, :total_length, :read_length, :finished,
  :finished_date

  def initialize(attributes = {})
  @title = attributes[:title]
  @author = attributes[:author]
  @total_length = attributes[:total_length]
  @read_length = attributes[:read_length]
  @finished = attributes[:finished] || false
  @finished_date = attributes[:finished_date] || 0
  @id = attributes[:id]
  end

def self.all
  DB.results_as_hash = true
  results = DB.execute ("SELECT * FROM books")
  results.map do |result|
    new_hash = result.transform_keys {|key| key.to_sym}
    Post.new(new_hash)
  end
end

def destroy
  DB.execute("DELETE FROM books where id = #{id}")
end

def save
  if @id.nil?
    DB.execute("INSERT INTO books (title, author, total_length, read_length) VALUES (?, ?, ?, ?)", [@title, @author, @total_length, @read_length])
    @id = DB.last_insert_row_id
  else
    DB.execute ("UPDATE books SET title = ?, author = ?, total_length = ?, read_length = ? WHERE id = ?" [@title, @author, @total_length, @read_length, @id])
end
end

end
