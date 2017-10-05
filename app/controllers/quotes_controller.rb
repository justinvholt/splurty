class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end
  
  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?(:saying.length < 5)
      flash[:error] = '<strong>Could not save.</strong> How you gonna inspire people to see the world with a quote that short?!'
      redirect_to root_path
    elsif  @quote.invalid?(:saying.length > 280)
      flash[:error] = '<strong>Could not save.</strong> Your quote is simply too long. You better make sure you didn\'t miss your flight typing it out!'
      redirect_to root_path
    elsif @quote.invalid?(:author.length)
      flash[:error] = '<strong>Could not save.</strong> Don\'t forget to give credit where its due!'
      redirect_to root_path
    end
  end

  private
  
  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
  
  def destination
  end

  def about
  end

end