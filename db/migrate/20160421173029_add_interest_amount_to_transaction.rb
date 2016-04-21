class AddInterestAmountToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :interest_amount, :string
  end
end
