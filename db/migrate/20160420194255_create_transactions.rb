class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :borrowing_amount
      t.float :advance_APR
      t.float :number_of_days
      t.float :amount
      t.float :wirefee
      t.float :cardprocessingfee
      t.boolean :quickest
      t.boolean :cheapest

      t.timestamps null: false
    end
  end
end
