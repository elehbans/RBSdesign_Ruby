class InputController < ApplicationController
  
  
  def create
    @input = Input.new
    
    # Make params hash accessible to model
    Input.assign_hash_from_controller(params)
    
    # breakdown params hash into correct arg string in model
    @arg_string = Input.make_argstring()
    
    # run design (arg string) and save results array
    @results = Input.run_design(@arg_string)
    
    # Parse and save results to appropriate column
    @input.ProjName = params[:input][:ProjName]
    @input.gene = params[:input][:GeneName]
    @input.Freq_table = params[:input][:FreqTable]
    @input.Final_RBS = Input.find_result(@results,0,2)
    @input.Final_Expr = Input.find_result(@results,2,2)
    @input.dG_Hyb = Input.find_result(@results,3,3)
    @input.dG_mRNA = Input.find_result(@results,4,3)
    @input.Final_FullSeq = Input.find_result(@results,1,2)
    @input.Final_Report_Name = Input.find_result(@results,7,3)
    @input.save!
    
    render :results
  end
  
end
