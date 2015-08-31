json.array!(@deposits) do |deposit|
  json.extract! deposit, :id, :account_id, :user_id, :tenure_in_years, :tenure_in_months, :tenure_in_days, :maturity_proceeds
  json.url deposit_url(deposit, format: :json)
end
