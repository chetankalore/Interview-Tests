class User < ActiveRecord::Base
	has_many :accounts
	has_many :deposits, through :accounts
end
