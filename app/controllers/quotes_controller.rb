class QuotesController < ApplicationController
  def index
    @quote = Quote.order('RANDOM()').first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      if @quote.saying.length < 5
        flash[:error] = '<strong>Could not save.</strong> How you gonna inspire people to see the world with a quote that short?!'
      elsif @quote.saying.length > 280
        flash[:error] = '<strong>Could not save.</strong> Your quote is simply too long. You better make sure you didn\'t miss your flight typing it out!'
    elsif @quote.author.length < 5 || @quote.author.length > 50 
      flash[:error] = '<strong>Could not save.</strong> Don\'t forget to give credit where its due!'
      end
    end

    if @quote.saying[0] == '"' || @quote.saying[-1] == '"'
      @quote.saying = @quote.saying.tr('\"', "")
    end

    # if @quote.save
    #   UserMailer.confirm_or_no(@quote).deliver
    # end

    redirect_to root_path
  end
  
  def destination
  end

  def about
    @skip_footer = true
  end

  private
  
  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end