class HomesController < ApplicationController
  def top
  end
  
  def index
    @book = Book.all
  end
  


 
end
