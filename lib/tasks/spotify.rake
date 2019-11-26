task :test_ayenda => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda1 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success1.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda2 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success2.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda3 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success3.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda4 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success4.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda5 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success5.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda6 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success6.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda7 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success7.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda8 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success8.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda9 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success9.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda10 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success10.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end

task :test_ayenda11 => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success11.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end
