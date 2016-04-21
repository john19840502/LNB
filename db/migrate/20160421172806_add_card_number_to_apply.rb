class AddCardNumberToApply < ActiveRecord::Migration
  def change
    add_column :applies, :card_number, :string
  end
end
