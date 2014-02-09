class PostsController < ApplicationController

  def index
    @posts = Post.where(flagged: false).paginate(page: params[:page]).order('created_at ASC')
  end
end
