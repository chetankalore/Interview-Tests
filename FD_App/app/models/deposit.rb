class Deposit < ActiveRecord::Base	
	belongs_to :account

	def calculate_interest(tenure_in_years, tenure_in_months, tenure_in_days, user_age)
		if user_age < 60
			# Normal user			
		else
			# Senior Citizen
		end	
	end	
end
