class PostsController < ApplicationController
  before_action :require_signed_in
  before_action :unless_author_or_mod, only: [:edit, :update, :destroy]
  before_action :must_have_sub, only: [:create, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def unless_author_or_mod
    @post = Post.find(params[:id])
    redirect_to sub_url(@post.sub) unless (current_user == @post.author || current_user == @post.sub.moderator)
  end

  def must_have_sub
    unless post_params[:sub_ids].length > 1
      if params[:aktion] == posts_url
        flash.now[:errors] = ["Must select at least 1 sub"]
        @post = Post.new(post_params)
        render :new
      else
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to subs_url
      end
    end
  end
end
