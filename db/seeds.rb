# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Note.destroy_all
Notebook.destroy_all

(1..5).each do |n|
  notebook = Notebook.create(title: "Notebook ##{n}")
  (1..10).each do |t|
    note = Note.create(title: "Note no. #{t}", body: "Some note copy", notebook: notebook)
  end
end

