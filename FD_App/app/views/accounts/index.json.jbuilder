json.array!(@accounts) do |account|
  json.extract! account, :id, :account_number, :user_id, :type_account, :tenure_in_years, :tenure_in_months, :tenure_in_days, :maturity_proceeds
  json.url account_url(account, format: :json)
end
