case Rails.env
when "development"
  load Rails.root.join("db", "seeds", "development.seeds.rb")
when "production"
  load Rails.root.join("db", "seeds", "production.seeds.rb")
else
  puts "No seed data for the '#{Rails.env}' environment."
end
