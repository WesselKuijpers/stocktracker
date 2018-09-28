class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "Empty search"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Incorrect symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end