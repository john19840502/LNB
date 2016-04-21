class AddSocialSecurityNumberToApply < ActiveRecord::Migration
  def change
    add_column :applies, :social_security_number, :string
  end
end
