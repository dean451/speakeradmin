# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


interactive_session = Session.create(
  title: "Boost up with BlockChain Bots",
  description: "Leverage bleeding edge technology with the public ledger.",
  track: "Code and Development",
  source: "https://BlockChain.io"
)
interactive_session.speakers.create(name: "Elon Musk")
interactive_session.speakers.create(name: "Peter Thiel")
interactive_session.speakers.create(name: "Mark Zuckerberg")
interactive_session.speakers.create(name: "Mark Cuban")
interactive_session.speakers.create(name: "Ajit Pai")
interactive_session.speakers.create(name: "Jared Kushner")

edu_session = Session.create(
  title: "Privatize Education? Get real!",
  description: "Are teachers over paid? You bet!",
  track: "CE Learning",
  source: "https://www.ed.gov/",
)
edu_session.speakers.create(name: "Betsy Devos")
edu_session.speakers.create(name: "Ivanka Trump")
edu_session.speakers.create(name: "Nikki Hailey")
edu_session.speakers.create(name: "Maria Shriver")
