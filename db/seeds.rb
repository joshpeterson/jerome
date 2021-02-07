# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative '../external/BibleParser/lib/load.rb'

translations = [
    {:name => "Douay-Rheims", :file_name => "douay-rheims"},
    {:name => "King James", :file_name => "king-james"},
]

translations.each do |translation|
    puts "Loading translation #{translation[:name]}"
    bible = load(translation[:file_name])
    db_bible = Bible.create(name: translation[:name])
    db_books = []
    bible.books.each do |book|
        puts "Processing book #{book.title} with #{book.chapters.length} chapters"
        db_book = Book.create(title: book.title)
        db_chapters = []
        book.chapters.each do |chapter|
            db_chapter = Chapter.create
            db_verses = []
            chapter.verses.each do |verse|
                db_verse = Verse.create(text: verse.text)
                db_verse.save
                db_verses.append(db_verse)
            end
            db_chapter.verses = db_verses
            db_chapter.save
            db_chapters.append(db_chapter)
        end
        db_book.chapters = db_chapters
        db_book.save
        db_books.append(db_book)
    end
    puts "Finished processing books"
    db_bible.books = db_books
    db_bible.save
    puts "Finished translation #{translation[:name]}"
end
puts "Done!"
