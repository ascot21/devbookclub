class TagsController < ApplicationController
  def new
    @tag = Tag.new(params[:id])
  end
end