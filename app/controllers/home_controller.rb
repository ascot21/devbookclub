class HomeController < ApplicationController

  def index
    @recent_books = Book.limit(5).order("created_at DESC")
  end

end
