class SearchController < ApplicationController
  
  def new
    render :search
  end

  def results
    @query = params[:query].to_s
    
    #search dbase for query (exact / downcased?)
    
    # save list of ids that match
    render :search_results
  end
  
end
