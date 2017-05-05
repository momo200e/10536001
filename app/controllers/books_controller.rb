class BooksController < ActionController::Base
	  def index
		@books = Book.all
	  end
	 def new
    @book=Book.new
  end
  
  def create
    @book =Book.new(book_params)
    if @book.save
       redirect_to books_path
    else
      render 'new'
      # redirect_to new_candidate_path
    end
  end
	 def show
   @book=Book.find_by(id: params[:id])
  end

  def book_params
    params.require("book").permit(:name,:price,:author,:introduction)
  end
end