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
       redirect_to library_path
    else
      render 'new'
      # redirect_to new_candidate_path
    end
  end
	end