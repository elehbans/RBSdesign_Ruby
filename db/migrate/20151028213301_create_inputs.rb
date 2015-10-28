class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.string :RBS_Mode
      t.string :dG_Hyb
      t.string :dG_mRNA
      t.string :MaxIter
      t.string :Preseq
      t.string :CDS
      t.string :Freq_table

      t.timestamps null: false
    end
  end
end
