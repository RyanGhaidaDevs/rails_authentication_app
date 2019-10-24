# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.last
log1 = Log.create(user_id: user.id, title: "first bug", languages: "ruby, rails, react", key_words_bug: "associations, backend, instance creation", key_words_solution: "", solved: false)
log2 = Log.create(user_id: user.id, title: "second bug", languages: "react router", key_words_bug: "session passing", key_words_solution: "", solved: false)