class Apply < ActiveRecord::Base
  validates :borrowing_amount, :days_to_borrow, :log_on_username, :log_on_pwd, :advance_limit, :advance_APR, presence: true

  def autoCalculation(regular_or_discount,  cheapest_or_quickest)
    scenario_num_rate = 5
    wire_fee = 25
    advances_apr_temp = self.advance_APR.to_f
    credit_card_processing_fee_rate = 4
    regular_discount_rate = 5
    auth_rate = 1

    self.log_on_pwd.blank? ? auth_or_not = 0 : auth_or_not = 1

    scenario_num = 1 if self.borrowing_amount.to_f < self.advance_limit.to_f
    scenario_num = 2 if self.borrowing_amount.to_f > self.advance_limit.to_f
    scenario_num = 3 if self.borrowing_amount.to_f == self.advance_limit.to_f

    case scenario_num
      when 1
        advances_apr_temp = self.advance_APR.to_f - scenario_num_rate
      when 2
        advances_apr_temp = self.advance_APR.to_f + scenario_num_rate
      when 3
        advances_apr_temp = self.advance_APR.to_f + scenario_num_rate
    end

    apr = advances_apr_temp - regular_discount_rate * regular_or_discount - auth_rate * auth_or_not
    interest_rate = (apr / 365 * self.days_to_borrow.to_f).to_f
    interest = (self.borrowing_amount.to_f * interest_rate / 100).to_f
    total_on_credit_card = (self.borrowing_amount.to_f + interest).to_f
    wire_fee_amount = (cheapest_or_quickest * wire_fee).to_f
    credit_card_processing_fee = ((total_on_credit_card + wire_fee_amount) * credit_card_processing_fee_rate / 100).to_f
    total_borrower = (self.borrowing_amount.to_f - credit_card_processing_fee - wire_fee_amount).to_f

    transaction = {}
    transaction = { borrowing_amount: self.borrowing_amount.to_f,
                    advance_APR: self.advance_APR.to_f,
                    number_of_days: self.days_to_borrow.to_f,
                    amount: total_on_credit_card.to_f,
                    wirefee: wire_fee.to_f,
                    cardprocessingfee: credit_card_processing_fee.to_f,
                    quickest: !cheapest_or_quickest,
                    cheapest: cheapest_or_quickest,
                    interest_amount: interest.to_f,
                    discount_or_premium: regular_or_discount,
                    received_money: total_borrower}
    return transaction
  end
end
