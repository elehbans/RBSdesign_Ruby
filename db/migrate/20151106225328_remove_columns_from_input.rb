class RemoveColumnsFromInput < ActiveRecord::Migration
  def change
    remove_column :inputs, :MaxIter, :string
    remove_column :inputs, :Preseq, :string
    remove_column :inputs, :CDS, :string
    remove_column :inputs, :Freq_Table, :string
  end
end
