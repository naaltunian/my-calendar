# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000.times do
  start_at = Faker::Time.between(
              1.year.ago, 1.year.from_now, :day
              ).beginning_of_hour.to_datetime

  end_at   = start_at + rand(1..4).hours

  title       = [
                    Faker::FamilyGuy.character,
                    Faker::SiliconValley.character,
                    Faker::Seinfeld.character
                  ].sample
  description = [
                  Faker::ChuckNorris.fact,
                  Faker::BackToTheFuture.quote,
                  Faker::Matz.quote
                ].sample

  Event.create!(
    title:        title,
    description:  description,
    start_at:     start_at,
    end_at:       end_at
  )
end

puts "#{Event.count} events..."
