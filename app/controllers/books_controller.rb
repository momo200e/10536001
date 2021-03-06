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
	def find_book
  @candidate = Candidate.find_by(id: params[:id])
  redirect_to candidates_path, notice:"no data!" if @candidate.nil?
  end
  
  def book_params
    params.require("book").permit(:name,:price,:author,:introduction)
  end
	
 
 
  
  
   
  def edit
		@book = Book.find_by(id: params[:id])
  end
  def update
 
    @book = Book.find_by(id: params[:id])

      if @book.update(book_params)
        # 成功
        redirect_to books_path, notice: "資料更新成功!"
      else
        # 失敗
        render :edit
      end
  end
 
 def destroy
      @book = Book.find_by(id: params[:id])
      @book.destroy if @book
      redirect_to candidates_path, notice: "資料已刪除!"
    end

end