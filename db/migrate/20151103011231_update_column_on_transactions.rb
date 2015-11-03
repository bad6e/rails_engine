class UpdateColumnOnTransactions < ActiveRecord::Migration
  def change
    rename_column :transactions, :cc_number, :credit_card_number
    rename_column :transactions, :cc_exp_date, :credit_card_expiration_date
  end
end
