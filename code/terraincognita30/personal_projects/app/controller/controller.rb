require "sqlite3"
require_relative "../models/book"

class Controller
def initialize
  @view = View.new
end

def index
  list_all = Book.all
  @view.list_all(list_all)
end

def create
  title_input = @view.ask_for("title")
  author_input = @view.ask_for("author")
  length_input = @view.ask_for("length of book")
  new_book = Book.new(title: title_input, author: author_input, total_length: length_input)
  new_book.save
end

def delete
    index
    list_all = Book.all
    index_to_destroy = @view.ask_for("index to destroy").to_i - 1
    book_to_destroy = list_all[index_to_destroy]
    book_to_destroy.destroy
end

def update
    index
    list_all = Post.all
    index_to_update = @view.ask_for("index to update").to_i - 1
    book_to_update = list_all[index_to_update]
    title_to_update = @view.ask_for("title")

    book_to_update.title = title_to_update
    author_to_update = @view.ask_for("author")
    book_to_update.author = author_to_update

    book_to_update.save
end

def search
end

end
