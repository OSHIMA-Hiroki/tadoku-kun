class BookSearchService
  def self.search(query)
    new.search(query)
  end

  def initialize
    @results = []
  end

  def search(query)
    return [] if query.blank?

    # Search existing books in database
    books = Book.where("title ILIKE ? OR author ILIKE ?", "%#{query}%", "%#{query}%")
                .limit(10)

    books.map do |book|
      {
        title: book.title,
        author: book.author || "Unknown Author",
        yl: book.yomiyasusa_level,
        word_count: book.word_count,
        isbn: book.isbn || "",
        confidence: "高",
        source: "Database"
      }
    end
  end
end