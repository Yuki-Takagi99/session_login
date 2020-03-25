class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  #set_blogアクションを他のメソッドが実行される前に実行する処理
  #onlyオプションをつけることで、指定されたアクションが実行された場合のみ実行される

  def index
    @blogs = Blog.all #Blogの中にある全てのレコードを出力する処理
  end
  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end

  def show
    # @blog = Blog.find(params[:id])
  end
  def edit
    # @blog = Blog.find(params[:id])
  end
  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
