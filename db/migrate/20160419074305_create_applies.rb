class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :first_name
      t.string :last_name
      t.string :borrowing_amount
      t.string :days_to_borrow
      t.string :card_exp_date
      t.string :card_cvv
      t.string :america_experss_cvv
      t.string :card_company
      t.string :card_issuer
      t.string :card_website_address
      t.string :log_on_username
      t.string :log_on_pwd
      t.integer :card_limit
      t.integer :total_limit
      t.integer :outstanding_balance
      t.integer :advance_limit
      t.string :advance_APR

      t.timestamps null: false
    end
  end
end
