Given /^the following users?$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    user = User.create!(row)
  end
end
