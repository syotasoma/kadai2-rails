class BooksController < ApplicationController
 def index 
  @books = Book.all
  @book = Book.new
 end
  def create
    @book = Book.new(book_params)
  if @book.save
    flash[:notice] = "投稿に成功しました。"
    redirect_to book_path(@book.id)
  else
    @book = Book.all
    render :index
  end 
  end 
  
  def index
  @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end 
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end 
 private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end 
end 
