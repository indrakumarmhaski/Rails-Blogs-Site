class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  access all: [], user: :all, admin: :all

  # GET /blogs
  def index
    if current_user
      @user = User.find(current_user.id)
    else
      redirect_to blogs_path and return
    end
    @blogs = @user.blogs.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /blogs/1
  def show
    if @blog.user.id == current_user.id  

    else
      redirect_to blogs_path, notice: 'This blog does not belongs to you.'
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if current_user
      @blog.user_id = current_user.id
    else
      redirect_to blogs_path and return
    end

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.user.id == current_user.id
      if @blog.update(blog_params)
        redirect_to @blog, notice: 'Blog was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to edit_blog_path, notice: 'This blog does not belongs to you.'
    end
  end

  # DELETE /blogs/1
  def destroy
    if @blog.user.id == current_user.id  
      @blog.destroy
      redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
    else
      redirect_to edit_blog_path, notice: 'This blog does not belongs to you.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:title, :description, :content, :thumbimg, :mainimg)
    end
end
