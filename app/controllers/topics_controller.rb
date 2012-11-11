class TopicsController < ApplicationController

  before_filter :set_book
  before_filter :lookup_topic, :except => [:new,:create]

  def index
    @topics = Topic.all
  end

  def create
    @topic = @book.topics.new(params[:topic])
    if @topic.save
      flash[:notice] = "Your topic was created."
      redirect_to @book
    else
      flash[:error] = "Your topic was not created. #{@topic.errors.full_messages.join}"
      render :new
    end
  end

  def new
    @topic = @book.topics.new
  end

  def update
    if @topic.update_attributes(params[:topic])
      redirect_to @topic
    else
      flash[:error] = @topic.errors.full_messages.join
      render :edit
    end
  end

  def show
    lookup_topic
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def lookup_topic
    @topic = @book.topics.find(params[:id])
  end

end
