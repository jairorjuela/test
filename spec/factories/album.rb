FactoryBot.define do
  factory :album do
    name                  { Faker::Music.album }
    image                 { Faker::Internet.url }
    spotify_url           { Faker::Internet.url }
    total_tracks          { rand(1..50) }
    spotify_id            { rand(1..50).to_s }

    association :artist,  factory: :artist
  end
end
