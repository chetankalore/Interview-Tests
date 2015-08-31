class AddColumnInterestToDeposits < ActiveRecord::Migration
  def change
  	add_column :deposits, :interest, :float
  end
end
