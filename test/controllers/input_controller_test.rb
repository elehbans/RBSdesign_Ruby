require 'test_helper'

class InputControllerTest < ActionController::TestCase
  
  test "submit project" do
    post :create, input: {:ProjName => "Hello_world",
                              :RBS_Mode => "RBS Only",
                              :MaxIter => "30",
                              :dG_Hyb_val => "-5",
                              :dG_mRNA_val => "-5",
                              :dG_Hyb => "Precise",
                              :dG_mRNA => "Precise",
                              :PreSeq => "ATCAtcattcactcggcagctctCAGGAggtaGAAC",
                              :CDS => "ATGGCGACACTCTCATTACTCgacttgggttttgt",
                              :FreqTable => "Aponinum",
                              :GeneName => "Atfa45",
                              :CodOptAllow => "No"
                              }
    assert_template "results"
  end
end
