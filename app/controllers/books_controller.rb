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
    flash.now[alert] = "投稿に失敗しました。"
    @books = Book.all
    render :index
  end 
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
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    else
    render :edit
    end 
  end 
 private
  def book_params
    params.require(:book).permit(:title, :body)
  end 
end 
