class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_number
      t.integer :user_id
      t.string :type_account      

      t.timestamps null: false
    end
  end
end
