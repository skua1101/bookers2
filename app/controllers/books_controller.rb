class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #投稿時ログインしているユーザーのidを保存する記述
    if @book.save
       flash[:notice]="You have creatad book successfully."
       redirect_to book_path(@book) #詳細表示画面へ
    else
       @books = Book.all #renderでindexページを呼び出すなら、indexで定義されている変数も一緒に持ってくること
       @user = User.find(current_user.id)
       render "index"
    end
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id) #ログインしているユーザー
    @book = Book.new #新規投稿の部分テンプレート
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
     @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end

  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
