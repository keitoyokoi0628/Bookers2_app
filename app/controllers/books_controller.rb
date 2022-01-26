class BooksController < ApplicationController
    def index
     @book = Book.new
     @books = Book.all
     @user = current_user
    end

    def new
     @book = Book.new
    end

    def edit
     @book = Book.find(params[:id])
    end

    def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to book_path(@book)
    end

    private

    def book_params
     params.require(:book).permit(:title, :body, :image)
    end

end