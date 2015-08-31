class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.integer :account_id
      t.integer :user_id
      t.integer :tenure_in_years
      t.integer :tenure_in_months
      t.integer :tenure_in_days
      t.boolean :maturity_proceeds

      t.timestamps null: false
    end
  end
end
