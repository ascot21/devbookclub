class TagsController < ApplicationController
  def new
    @tag = Tag.new(params[:id])
  end

  def create
    @tag = Tag.create!(params[:tag])
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.js
    end
  end

  def index
    @tags = Tag.all
  end

end