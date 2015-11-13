class SearchController < ApplicationController
  
  def new
    render :search
  end

  def results
    @query = params[:query].to_s.downcase
    @results = Input.where("Gene = ?", @query)
    render :search_results
  end
  
end
