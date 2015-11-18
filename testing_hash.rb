class Test
require 'csv'  

def get_expr_vals
  @expr_val_hash = {}

  CSV.foreach("org_specific_energies.csv", :headers => true) do |row|
    @expr_val_hash[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
  end
end

def printing
  apon = "Aponinum"
  hyb = "mRNA_H"
  varbob = @expr_val_hash[apon][hyb]
  p varbob
end

testing = Test.new
testing.get_expr_vals
testing.printing



end