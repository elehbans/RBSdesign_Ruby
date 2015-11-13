class Input < ActiveRecord::Base
  require 'open3'

  def dG_Hyb_val
  end
  
  def dG_mRNA_val
  end
  
  def PreSeq
  end
  
  def CDS
  end
  
  def GeneName
  end
  
  def MaxIter
  end
  
  def ProjName
  end
  
  def FreqTable
  end
  
  def CodOptAllow
  end
  
  def Window_start
  end

  def Window_length
  end
  
  def RBS_Mode
  end
  
  def self.assign_hash_from_controller(parameters)
    @params = parameters
  end
  
  def self.make_argstring()
    rbs_mode = @params[:input][:RBS_Mode]
    if rbs_mode == "RBS Only"
      rbs_mode = "Only"
    elsif rbs_mode == "Window"
      start = @params[:input][:Window_start]
      length = @params[:input][:Window_length]
      rbs_mode = start + ":" + length
    end
    
    dG_mRNA = @params[:input][:dG_mRNA]
    if dG_mRNA == "Precise"
      dG_mRNA = "P"
    else
      dG_mRNA = "G"
    end
    
    dG_Hyb = @params[:input][:dG_Hyb]
    if dG_Hyb == "Precise"
      dG_Hyb = "P"
    else
      dG_Hyb = "G"
    end
    
    freq_table = @params[:input][:FreqTable]
    if freq_table == "Chlamydomonas"
      freq_table = "Chlamy_codons.csv"
    else
      freq_table = "Apon_codons.csv"
    end
    
    max_iter = @params[:input][:MaxIter]
    dG_Hyb_val = @params[:input][:dG_Hyb_val]
    dG_mRNA_val = @params[:input][:dG_mRNA_val]
    pre_seq = @params[:input][:PreSeq]
    cds = @params[:input][:CDS]
    proj_name = @params[:input][:ProjName]
    opt_allow = @params[:input][:CodOptAllow]
    
    out_file = proj_name + "_" + Input.randstring
    
    arg_string = rbs_mode + " " + dG_Hyb + ":" + dG_Hyb_val + " " + dG_mRNA + ":" + dG_mRNA_val + " " + max_iter + " " + pre_seq + " " + cds + " " + out_file + " " + freq_table + " " + opt_allow
  
    return arg_string
  end
  
  def self.run_design(arg_string)
    text = "python MG_RBSdesign.py " + arg_string
    py_results = Open3.capture2(text)
    ls_of_results = py_results[0].split("\n")
    return ls_of_results
  end

  def self.find_result(array_name,start_arr_pos, num_spaces)
    temp_dic = array_name[start_arr_pos]
    temp_dic = temp_dic.split()
    temp_string = temp_dic[num_spaces]
    return temp_string
  end
  
  def self.randstring()
    randstring = ('a'..'z').to_a.shuffle[0,8].join
    return randstring
  end
  

end
