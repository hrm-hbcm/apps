class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.order("created_at DESC")
  end
end
