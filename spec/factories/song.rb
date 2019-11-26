FactoryBot.define do
  factory :song do
    name                  { Faker::Music::Phish.song }
    spotify_url           { Faker::Internet.url }
    preview_url           { Faker::Internet.url }
    duration_ms           { rand(1..20) }
    explicit              { Faker::Boolean.boolean }
    spotify_id            { rand(1..50).to_s }

    association :album,   factory: :album
  end
end
