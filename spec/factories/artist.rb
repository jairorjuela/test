FactoryBot.define do
  factory :artist do
    name                  { Faker::Music.band }
    image                 { Faker::Internet.url }
    genres                { Faker::Music.genre }
    popularity            { rand(1..9) }
    spotify_url           { Faker::Internet.url }
    spotify_id            { rand(1..50).to_s }
  end
end
