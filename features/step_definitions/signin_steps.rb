Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
      @user = User.create!(attributes)
      @user.update_attribute("admin", attributes["admin"] == "true")
  end
end


