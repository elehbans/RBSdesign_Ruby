class RemoveRbsFromInput < ActiveRecord::Migration
  def change
    remove_column :inputs, :RBS_Mode, :string
  end
end
