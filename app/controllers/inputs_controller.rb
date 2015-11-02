class InputsController < ApplicationController
  require 'open3'
  
  def index
    render :results
  end
  
  def create
    @RBS_Mode = params[:input][:RBS_Mode]
    if @RBS_Mode == "RBS ONLY"
      @RBS_Mode = @RBS_Mode[-4..-1]
    end
    
    @dG_mRNA = params[:input][:dG_mRNA]
    if @dG_mRNA == "Precise"
      @dG_mRNA = "P"
    else
      @dG_mRNA = "G"
    end
    
    @dG_Hyb = params[:input][:dG_Hyb]
    if @dG_Hyb == "Precise"
      @dG_Hyb = "P"
    else
      @dG_Hyb = "G"
    end
    
    @FreqTable = params[:input][:FreqTable]
    if @FreqTable == "Chlamydomonas"
      @FreqTable = "Chlamy_codons.csv"
    else
      @FreqTable = "Apon_codons.csv"
    end
    
    @MaxIter = params[:input][:MaxIter]
    @dG_Hyb_val = params[:input][:dG_Hyb_val]
    @dG_mRNA_val = params[:input][:dG_mRNA_val]
    @PreSeq = params[:input][:PreSeq]
    @CDS = params[:input][:CDS]
    @ProjName = params[:input][:ProjName]
    
    randstring = ('a'..'z').to_a.shuffle[0,8].join
    @Output_Filename = @ProjName + "_" + randstring
    
    @arg_string = @RBS_Mode + " " + @dG_Hyb + ":" + @dG_Hyb_val + " " + @dG_mRNA + ":" + @dG_mRNA_val + " " + @MaxIter + " " + @PreSeq + " " + @CDS + " " + @Output_Filename + " " + @FreqTable
    
    @text = "python MG_RBSdesign.py " + @arg_string
    @py_results = Open3.capture2(@text)
    
    @ls_of_results = @py_results[0]
    @ls_of_results = @ls_of_results.split("\n")
    
    #@Final_string = @RBS_mode + @dG_Hyb + @dG_Hyb_val + @dG_mRNA + @dG_mRNA_val + @PreSeq + @CDS + @ProjName + @FreqTable
    render :results
  end
  
end
