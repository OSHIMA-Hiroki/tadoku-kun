# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Creating sample books..."

# SEG推薦図書リストを基にした初期書籍データ
books_data = [
  # YL 0.0 - 0.9 レベル
  {
    title: "Brown Bear, Brown Bear, What Do You See?",
    author: "Bill Martin Jr.",
    yomiyasusa_level: 0.5,
    word_count: 180,
    isbn: "9780805047905"
  },
  {
    title: "Go, Dog. Go!",
    author: "P.D. Eastman",
    yomiyasusa_level: 0.8,
    word_count: 800,
    isbn: "9780394800202"
  },
  {
    title: "Green Eggs and Ham",
    author: "Dr. Seuss",
    yomiyasusa_level: 0.7,
    word_count: 650,
    isbn: "9780394800165"
  },

  # YL 1.0 - 1.9 レベル
  {
    title: "Frog and Toad Are Friends",
    author: "Arnold Lobel",
    yomiyasusa_level: 1.2,
    word_count: 1800,
    isbn: "9780064440202"
  },
  {
    title: "Little Bear",
    author: "Else Holmelund Minarik",
    yomiyasusa_level: 1.0,
    word_count: 1400,
    isbn: "9780064440042"
  },
  {
    title: "The Cat in the Hat",
    author: "Dr. Seuss",
    yomiyasusa_level: 1.5,
    word_count: 1600,
    isbn: "9780394800011"
  },

  # YL 2.0 - 2.9 レベル
  {
    title: "Charlie and the Chocolate Factory",
    author: "Roald Dahl",
    yomiyasusa_level: 2.8,
    word_count: 30000,
    isbn: "9780142410318"
  },
  {
    title: "The BFG",
    author: "Roald Dahl",
    yomiyasusa_level: 2.5,
    word_count: 26000,
    isbn: "9780142410387"
  },
  {
    title: "Matilda",
    author: "Roald Dahl",
    yomiyasusa_level: 2.7,
    word_count: 45000,
    isbn: "9780142410370"
  },

  # YL 3.0 - 3.9 レベル
  {
    title: "Harry Potter and the Philosopher's Stone",
    author: "J.K. Rowling",
    yomiyasusa_level: 3.5,
    word_count: 77000,
    isbn: "9780439708180"
  },
  {
    title: "The Lion, the Witch and the Wardrobe",
    author: "C.S. Lewis",
    yomiyasusa_level: 3.2,
    word_count: 36000,
    isbn: "9780064404990"
  },
  {
    title: "Holes",
    author: "Louis Sachar",
    yomiyasusa_level: 3.8,
    word_count: 47000,
    isbn: "9780374332655"
  },

  # YL 4.0 - 4.9 レベル
  {
    title: "The Giver",
    author: "Lois Lowry",
    yomiyasusa_level: 4.2,
    word_count: 43000,
    isbn: "9780544336261"
  },
  {
    title: "A Wrinkle in Time",
    author: "Madeleine L'Engle",
    yomiyasusa_level: 4.5,
    word_count: 49000,
    isbn: "9780312367541"
  },
  {
    title: "The Outsiders",
    author: "S.E. Hinton",
    yomiyasusa_level: 4.8,
    word_count: 48000,
    isbn: "9780142407332"
  },

  # YL 5.0+ レベル
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    yomiyasusa_level: 5.6,
    word_count: 100000,
    isbn: "9780061120084"
  },
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
    yomiyasusa_level: 5.8,
    word_count: 73000,
    isbn: "9780316769488"
  },
  {
    title: "1984",
    author: "George Orwell",
    yomiyasusa_level: 6.2,
    word_count: 88000,
    isbn: "9780452284234"
  }
]

books_data.each do |book_attrs|
  Book.find_or_create_by!(title: book_attrs[:title]) do |book|
    book.author = book_attrs[:author]
    book.yomiyasusa_level = book_attrs[:yomiyasusa_level]
    book.word_count = book_attrs[:word_count]
    book.isbn = book_attrs[:isbn]
  end
  print "."
end

puts "\n✅ Created #{Book.count} books!"
puts "📚 Sample data loaded successfully!"
