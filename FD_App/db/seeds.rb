# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(:first_name => "Chetan", :last_name => "Kalore", :email => "chetan.kalore@gmail.com", :mobile => "8087050026", :pan => "SDFDGGFGF")
Account.create(:account_number => 1000, :user_id => user.id, :type_account => "Saving", :balance => 5000)