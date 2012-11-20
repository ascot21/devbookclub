class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @topic = Topic.find(params[:topic_id])
    @comment  = @topic.comments.new(params[:comment])
    @comment.commenter = current_user
    if @comment.save
      flash[:notice] = "Your comment was added."
      redirect_to book_topic_path(@book,@topic)
    else
      flash[:error] = "Your comment was not added. #{@comment.errors.full_messages.join}"
      render :new
    end
  end

end