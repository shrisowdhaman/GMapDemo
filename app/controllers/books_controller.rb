class BooksController < ApplicationController
  
  def index
    
    @books = Book.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end
  
  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Post was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
end
