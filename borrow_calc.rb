def automatic_calc(advances_apr = 20, scenario_num = 1, scenario_num_rate = 5, regular_discount_rate = 5, auth_rate = 1, credit_card_processing_fee_rate = 4, wire_fee = 25, principal, due_date, regular_or_discount, auth_or_not, cheapest_or_quickest)
	advances_apr_temp = advances_apr;
	case scenario_num
		when 1
			advances_apr_temp = advances_apr - scenario_num_rate
		when 2
			advances_apr_temp = advances_apr + scenario_num_rate
		when 3
			advances_apr_temp = advances_apr + scenario_num_rate
	end
	apr = advances_apr_temp - regular_discount_rate * regular_or_discount - auth_rate * auth_or_not
	interest_rate = (apr / 365 * due_date).to_f
	interest = (principal * interest_rate / 100).to_f
	total_on_credit_card = (principal + interest).to_f
	wire_fee_amount = (cheapest_or_quickest * wire_fee).to_f
	credit_card_processing_fee = ((total_on_credit_card + wire_fee_amount) * credit_card_processing_fee_rate / 100).to_f
	total_borrower = (principal - credit_card_processing_fee - wire_fee_amount).to_f
	puts apr 
	puts interest_rate 
	puts interest 
	puts total_on_credit_card 
	puts wire_fee_amount 
	puts credit_card_processing_fee 
	puts total_borrower
end

automatic_calc(25.0,1.0,5.0,5.0,1.0,4.0,25.0,1000.0,29.0,0.0,0.0,1.0)
