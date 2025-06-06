namespace :books do
  desc "Update books database with SEG recommended reading list data"
  task update_from_seg: :environment do
    puts "Updating books from SEG recommended reading list..."
    
    # Define the book series data extracted from SEG site
    seg_books_data = [
      # Foundation Reading Library
      {
        title: "Foundations Reading Library Level 1",
        author: "Various Authors",
        yomiyasusa_level: "0.5-1.4",
        word_count: "500-3000",
        isbn: "",
        description: "75-350語レベル"
      },
      
      # Penguin Readers Series
      {
        title: "Penguin Readers Easystarts",
        author: "Various Authors", 
        yomiyasusa_level: "0.8",
        word_count: "900",
        isbn: "",
        description: "200語レベル"
      },
      {
        title: "Penguin Readers Level 1",
        author: "Various Authors",
        yomiyasusa_level: "1.0-1.4", 
        word_count: "1300-4400",
        isbn: "",
        description: "300語レベル"
      },
      {
        title: "Penguin Readers Level 2",
        author: "Various Authors",
        yomiyasusa_level: "2.2-2.6",
        word_count: "3500-11000", 
        isbn: "",
        description: "600語レベル"
      },
      {
        title: "Penguin Readers Level 3",
        author: "Various Authors",
        yomiyasusa_level: "3.2-3.8",
        word_count: "5600-21000",
        isbn: "",
        description: "1200語レベル"
      },
      {
        title: "Penguin Readers Level 4", 
        author: "Various Authors",
        yomiyasusa_level: "4.0-5.0",
        word_count: "12000-41000",
        isbn: "",
        description: "1700語レベル"
      },
      {
        title: "Penguin Readers Level 5",
        author: "Various Authors", 
        yomiyasusa_level: "5.0-6.0",
        word_count: "14000-46000",
        isbn: "",
        description: "2300語レベル"
      },
      {
        title: "Penguin Readers Level 6",
        author: "Various Authors",
        yomiyasusa_level: "6.0-7.0", 
        word_count: "22000-34000",
        isbn: "",
        description: "3000語レベル"
      },
      
      # Oxford Bookworms Series
      {
        title: "Oxford Bookworms Starters",
        author: "Various Authors",
        yomiyasusa_level: "0.8-0.9",
        word_count: "700-1500", 
        isbn: "",
        description: "250語レベル"
      },
      {
        title: "Oxford Bookworms Stage 1",
        author: "Various Authors",
        yomiyasusa_level: "2.0-2.2",
        word_count: "4800-7300",
        isbn: "",
        description: "400語レベル"
      },
      {
        title: "Oxford Bookworms Stage 2", 
        author: "Various Authors",
        yomiyasusa_level: "2.6-2.8",
        word_count: "5400-8500",
        isbn: "",
        description: "700語レベル"
      },
      {
        title: "Oxford Bookworms Stage 3",
        author: "Various Authors", 
        yomiyasusa_level: "3.2-3.4",
        word_count: "7800-11000",
        isbn: "",
        description: "1000語レベル"
      },
      {
        title: "Oxford Bookworms Stage 4",
        author: "Various Authors",
        yomiyasusa_level: "3.8-4.2",
        word_count: "14000-22000",
        isbn: "",
        description: "1400語レベル"
      },
      {
        title: "Oxford Bookworms Stage 5",
        author: "Various Authors",
        yomiyasusa_level: "4.5-5.0", 
        word_count: "18000-24000",
        isbn: "",
        description: "1800語レベル"
      },
      {
        title: "Oxford Bookworms Stage 6",
        author: "Various Authors",
        yomiyasusa_level: "5.5-6.0",
        word_count: "21000-31000",
        isbn: "",
        description: "2500語レベル"
      },
      
      # Macmillan Readers Series
      {
        title: "Macmillan Readers Starter",
        author: "Various Authors",
        yomiyasusa_level: "0.9",
        word_count: "500-600",
        isbn: "",
        description: "300語レベル"
      },
      {
        title: "Macmillan Readers Beginner",
        author: "Various Authors", 
        yomiyasusa_level: "1.2-1.4",
        word_count: "2000-4000",
        isbn: "",
        description: "600語レベル"
      },
      {
        title: "Macmillan Readers Elementary",
        author: "Various Authors",
        yomiyasusa_level: "3.0-3.2",
        word_count: "8000-12000", 
        isbn: "",
        description: "1100語レベル"
      },
      {
        title: "Macmillan Readers Pre-intermediate",
        author: "Various Authors",
        yomiyasusa_level: "3.4-3.6",
        word_count: "10000-15000",
        isbn: "",
        description: "1400語レベル"
      },
      {
        title: "Macmillan Readers Intermediate", 
        author: "Various Authors",
        yomiyasusa_level: "3.6-4.0",
        word_count: "12000-18000",
        isbn: "",
        description: "1600語レベル"
      },
      {
        title: "Macmillan Readers Upper",
        author: "Various Authors",
        yomiyasusa_level: "4.5-5.0",
        word_count: "18000-25000",
        isbn: "",
        description: "2200語レベル"
      },
      
      # Popular Book Series
      {
        title: "Magic Tree House Series",
        author: "Mary Pope Osborne",
        yomiyasusa_level: "2.5-3.5",
        word_count: "4900-6100",
        isbn: ""
      },
      {
        title: "Roald Dahl Series",
        author: "Roald Dahl", 
        yomiyasusa_level: "5.0-6.0",
        word_count: "30000-43000",
        isbn: ""
      },
      {
        title: "Harry Potter Series",
        author: "J.K. Rowling",
        yomiyasusa_level: "6.0-8.0",
        word_count: "70000-250000",
        isbn: ""
      },
      
      # Cambridge English Readers
      {
        title: "Cambridge English Readers Starter/Beginner",
        author: "Various Authors",
        yomiyasusa_level: "1.2-1.8",
        word_count: "1500-4000",
        isbn: ""
      },
      {
        title: "Cambridge English Readers Level 1",
        author: "Various Authors",
        yomiyasusa_level: "2.0-2.6",
        word_count: "3500-7000",
        isbn: ""
      },
      {
        title: "Cambridge English Readers Level 2",
        author: "Various Authors",
        yomiyasusa_level: "2.8-3.4",
        word_count: "7000-12000",
        isbn: ""
      },
      {
        title: "Cambridge English Readers Level 3",
        author: "Various Authors",
        yomiyasusa_level: "3.6-4.2",
        word_count: "12000-18000",
        isbn: ""
      },
      {
        title: "Cambridge English Readers Level 4",
        author: "Various Authors",
        yomiyasusa_level: "4.4-5.0",
        word_count: "18000-25000",
        isbn: ""
      },
      {
        title: "Cambridge English Readers Level 5",
        author: "Various Authors",
        yomiyasusa_level: "5.2-6.0",
        word_count: "25000-35000",
        isbn: ""
      },
      {
        title: "Cambridge English Readers Level 6",
        author: "Various Authors",
        yomiyasusa_level: "6.2-7.0",
        word_count: "35000-50000",
        isbn: ""
      }
    ]
    
    created_count = 0
    updated_count = 0
    
    seg_books_data.each do |book_attrs|
      book = Book.find_by(title: book_attrs[:title])
      
      if book
        # Update existing book
        book.update!(
          author: book_attrs[:author],
          yomiyasusa_level: book_attrs[:yomiyasusa_level],
          word_count: book_attrs[:word_count],
          isbn: book_attrs[:isbn].present? ? book_attrs[:isbn] : nil
        )
        updated_count += 1
        puts "Updated: #{book.title}"
      else
        # Create new book
        Book.create!(
          title: book_attrs[:title],
          author: book_attrs[:author], 
          yomiyasusa_level: book_attrs[:yomiyasusa_level],
          word_count: book_attrs[:word_count],
          isbn: book_attrs[:isbn].present? ? book_attrs[:isbn] : nil
        )
        created_count += 1
        puts "Created: #{book_attrs[:title]}"
      end
    end
    
    puts "\n✅ SEG books update completed!"
    puts "📚 Created: #{created_count} new books"
    puts "🔄 Updated: #{updated_count} existing books"
    puts "📖 Total books in database: #{Book.count}"
  end
end