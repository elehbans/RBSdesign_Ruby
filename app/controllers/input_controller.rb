class InputController < ApplicationController
  
  #def home
  #end
  
  def new
    @input = Input.new
  end
  
  def create
    @input = Input.new(input_params)
  end
  
  def input_params
      params.require(:input).permit(:RBS_Mode, :dG_Hyb, :dG_mRNA,
                                   :MaxIter, :Preseq, :CDS, :FreqTable)
  end
  
end
