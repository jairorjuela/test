task :test_ayenda => :environment do
  puts "filling database"

  file_name = "spec/fixtures/create_artists/success.yml"
  client = ENV["CLIENT_ID"]
  token = ENV["CLIENT_SECRET"]

  Create::Musicians.new.(
    { file_name: file_name, client: client, token: token }
  )
end
