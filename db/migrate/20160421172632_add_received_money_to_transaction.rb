class AddReceivedMoneyToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :received_money, :string
  end
end
