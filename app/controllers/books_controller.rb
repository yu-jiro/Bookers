class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all #データベース内の全てのデータを取り出すには、Bookモデルに対して.allメソッドを使う
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params) #bookインスタンスでは、Bookのメソッドでnew(新規投稿)が呼び出され、引数でbook_paramsが呼び出されている
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # ３. show画面へリダイレクト
    redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
     @book = Book.find(params[:id])
     @book.destroy
       if @book.destroy
         flash[:notice] = 'Book was successfully destroyed.'
         redirect_to books_path
    else
      render :index
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
