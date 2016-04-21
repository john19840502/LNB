class AddRelationshipToCreditcardToApply < ActiveRecord::Migration
  def change
    add_column :applies, :relationship_to_creditcard, :string
  end
end
