class BooksController < ApplicationController


  # 以下を追加
  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
     flash[:notice]="Book was successfully created"
    else
      @books =Book.all
      render :index
    end
  end
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
   book = Book.find(params[:id])
   book.destroy 
   redirect_to '/books'
  end 
  
  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book)
        flash[:notice]="Book was successfully created"
      else
        @books =Book.all
         render action: :edit
      end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

