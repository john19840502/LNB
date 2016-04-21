class AddDiscountOrPremiumToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :dicount_or_premium, :integer
  end
end
