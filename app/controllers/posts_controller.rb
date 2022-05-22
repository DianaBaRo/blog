class PostsController < ApplicationController
    before_action :require_login
    before_action :set_post, except: [:index, :new, :create]
  
    def index
      @users = User.all
      
      if !params[:user].blank? #filtered by user
        @posts = Post.by_user(params[:user])
      else
        @posts = Post.all
      end
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to user_path(current_user)
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path
    end
  
    private
    def post_params
      params.require(:post).permit(:title, :body)
    end
  
    def set_post
      @post = Post.find_by_id(params[:id])
    end
  end