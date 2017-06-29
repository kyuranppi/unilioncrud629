class HomeController < ApplicationController
  def index
    @posts=Post.all
  
  end
  
  def post
    post = Post.new
    post.title=params[:title]
    post.writer=params[:writer]
    post.content=params[:content]
    post.save
    
    redirect_to '/'
  end
  
  def detail
    @detail_post = Post.find(params[:post_id])
  end
  
  def delete
    delete_post = Post.find(params[:post_id])
    delete_post.destroy
    
    redirect_to '/'
  end
  
  def edit
    @edit_post = Post.find(params[:post_id])
  end
  
  def update
    update_post = Post.find(params[:post_id])
    update_post.writer = params[:writer]
    update_post.title = params[:title]
    update_post.content = params[:content]
    update_post.save
    
    redirect_to '/'
    
  end
  
  def comment
    comment = Comment.new
    comment.post_id = params[:post_id]
    comment.content = params[:content]
    comment.save
    
    redirect_to :back
  end
end
