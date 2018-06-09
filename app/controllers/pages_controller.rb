class PagesController < ApplicationController
  before_action :authenticate_user!, only:[:about]
  def home
  end

  def about
  end

  def allblogs
    @blogs = Blog.order(created_at: :desc).page(params[:page]).per(10)
  end
end
