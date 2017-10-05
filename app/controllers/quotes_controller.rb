class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end
  
  def new
    @quote = Quote.new
  end
  
  
  
  
  
  
  def destination
  end

  def about
  end

end