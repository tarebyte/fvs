class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

#   def actors
#     @title = 'Actors'
#     @users = User.search(query: {match: {role: "actor" }}).records
#       .paginate(page: params[:page])
#
#     render action: 'index'
#   end

#   def film_makers
#     @title = 'Film Makers'
#     @users = User.search(query: {match: {role: "film maker" }}).records
#     @users.to_a
#
#     render action: 'index'
#   end
end
