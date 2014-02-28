class SearchController < ApplicationController

  def index
  end

  def search
    if params[:query].length.zero?
      @users = nil
      @posts = nil
    else
      @users = User.search(params[:query])
        .records
        .paginate(page: params[:page])

      @posts = Post.search(params[:query])
        .records.where(flagged: false)
        .paginate(page: params[:page])

      @users = nil if @users.count.zero?
      @posts = nil if @posts.count.zero?
    end
      render action: 'index'
  end
end
