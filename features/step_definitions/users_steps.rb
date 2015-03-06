Given /^the following users?$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |row|
    user = User.create!(username: row[:username], email: row[:email],
            password: row[:password])
  end
end
