class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: post_params[:title], text: post_params[:text], user_id: current_user.id)
    
      if  @post.save
        redirect_to @post
      else
        render :new, status: :unprocessable_entity
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
