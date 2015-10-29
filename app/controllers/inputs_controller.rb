class InputsController < ApplicationController
  
  def index
    render :results
  end
  
  def create
    @RBS_mode = params[:input][:RBS_Mode]
    if @RBS_mode == "RBS ONLY"
      @RBS_mode = @RBS_mode[-4..-1]
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
      @FreqTable = "Apon_Codons.csv"
    end
    
    @dG_Hyb_val = params[:input][:dG_Hyb_val]
    @dG_mRNA_val = params[:input][:dG_mRNA_val]
    @Preseq = params[:input][:PreSeq]
    @CDS = params[:input][:CDS]
    @ProjName = params[:input][:ProjName]
    
    @Final_string = @RBS_mode + @dG_Hyb + @dG_Hyb_val + @dG_mRNA + @dG_mRNA_val + @PreSeq + @CDS + @ProjName + @FreqTable
    render :results
  end
  
end
