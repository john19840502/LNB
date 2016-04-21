class ApplyController < ApplicationController
  def index
  end

  def create
		params["apply_data"].delete("day")
	apply_data = Apply.new(JSON.parse params["apply_data"])
	if apply_data.save		
		# interest = apply_data.borrowing_amount < apply_data.advance_limit ? apply_data.advance_APR + 5 : apply_data.advance_APR - 5

		@trans_result = apply_data.autoCalculation(params["regular_or_discount"] == "regular" ? 0.0 : 1.0, params["quick_or_cheap"] == "cheapest" ? 0.0 : 1.0)

		render json: @trans_result , status: 'ok'
	else
		render json:  {status: 'not found'}
	end
  end

  private
     def apply_params
				params["apply_data"]

			 # params.fetch(:apply_data).
     end

end
