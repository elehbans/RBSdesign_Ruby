class AddColumnToInput < ActiveRecord::Migration
  def change
    add_column :inputs, :gene, :string
    add_column :inputs, :ProjName, :string
    add_column :inputs, :Final_RBS, :string
    add_column :inputs, :Final_FullSeq, :string
    add_column :inputs, :Final_Expr, :string
    add_column :inputs, :Final_Report_Name, :string
  end
end
