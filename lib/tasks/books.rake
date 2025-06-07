namespace :books do
  desc "Import books from book_info.json"
  task import: :environment do
    json_file = Rails.root.join('book_info.json')
    
    unless File.exist?(json_file)
      puts "Error: book_info.json not found in project root"
      exit 1
    end

    begin
      book_data = JSON.parse(File.read(json_file))
      
      puts "Starting import of #{book_data.length} books..."
      
      imported_count = 0
      skipped_count = 0
      error_count = 0
      
      book_data.each_with_index do |book_info, index|
        begin
          # Check if book already exists
          author = book_info['author'] || nil
          existing_book = Book.find_by(title: book_info['title'], author: author)
          
          if existing_book
            author_text = author.present? ? " by #{author}" : ""
            puts "Skipping duplicate: #{book_info['title']}#{author_text}"
            skipped_count += 1
            next
          end
          
          # Create new book - handle different field name variations
          book = Book.new(
            title: book_info['title'],
            author: book_info['author'], # Can be null
            yomiyasusa_level: book_info['YL'] || book_info['yl'] || book_info['yomiyasusa_level'],
            word_count: book_info['total_words'] || book_info['word_count'],
            isbn: book_info['isbn'] # Can be null
          )
          
          if book.save
            imported_count += 1
            author_text = book.author.present? ? " by #{book.author}" : ""
            puts "Imported: #{book.title}#{author_text}"
          else
            puts "Error saving book #{book_info['title']}: #{book.errors.full_messages.join(', ')}"
            error_count += 1
          end
        rescue StandardError => e
          puts "Error processing book at index #{index}: #{e.message}"
          error_count += 1
        end
      end
      
      puts "\nImport completed:"
      puts "  Imported: #{imported_count} books"
      puts "  Skipped: #{skipped_count} books (duplicates)"
      puts "  Errors: #{error_count} books"
      
    rescue JSON::ParserError => e
      puts "Error parsing JSON file: #{e.message}"
      exit 1
    rescue StandardError => e
      puts "Error during import: #{e.message}"
      exit 1
    end
  end

  desc "Clear all books from database"
  task clear: :environment do
    puts "Clearing all books and reading logs..."
    
    ReadingLog.delete_all
    Book.delete_all
    
    puts "All books and reading logs have been cleared."
  end
end