class InputController < ApplicationController
  require 'open3'
  
  def find_result(start_arr_pos, num_spaces)
    temp_dic = @ls_of_results[start_arr_pos]
    temp_dic = temp_dic.split()
    temp_string = temp_dic[num_spaces]
    return temp_string
  end
  
  def create
    @input = Input.new
    
    @RBS_Mode = params[:input][:RBS_Mode]
    if @RBS_Mode == "RBS Only"
      @RBS_Mode = "Only"
    elsif @RBS_Mode == "Window"
      start = params[:input][:Window_start]
      length = params[:input][:Window_length]
      @RBS_Mode = start + ":" + length
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
    @CodOptAllow = params[:input][:CodOptAllow]
    
    randstring = ('a'..'z').to_a.shuffle[0,8].join
    @Output_Filename = @ProjName + "_" + randstring
    
    @arg_string = @RBS_Mode + " " + @dG_Hyb + ":" + @dG_Hyb_val + " " + @dG_mRNA + ":" + @dG_mRNA_val + " " + @MaxIter + " " + @PreSeq + " " + @CDS + " " + @Output_Filename + " " + @FreqTable + " " + @CodOptAllow
    
    @text = "python MG_RBSdesign.py " + @arg_string
    @py_results = Open3.capture2(@text)
  
    @ls_of_results = @py_results[0].split("\n")
    
    
    @finalRBS = find_result(0,2)
    @final_fullseq = find_result(1,2)
    @final_expr = find_result(2,2)
    @final_dG_Hyb = find_result(3,3)
    @final_dG_mRNA = find_result(4,3)
    @final_report = find_result(7,3)
    
    @input.ProjName = @ProjName
    @input.gene = params[:input][:GeneName]
    @input.Freq_table = params[:input][:FreqTable]
    @input.Final_RBS = @finalRBS
    @input.Final_Expr = @final_expr
    @input.dG_Hyb = @final_dG_Hyb
    @input.dG_mRNA = @final_dG_mRNA
    @input.Final_FullSeq = @final_fullseq
    @input.Final_Report_Name = @final_report
    @input.save!
    
    render :results
  end
  
end
