class PostsController < ApplicationController
  skip_forgery_protection
  def index
    @posts = params[:tag] ? Post.tagged_with(params[:tag]) : Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.js
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:body,:all_tags)
  end
end
