class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.includes(:reading_logs)
    
    # 検索機能
    if params[:search].present?
      @books = @books.search_by_title(params[:search])
    end
    
    # YLレベルでフィルタ
    if params[:yomiyasusa_level].present?
      @books = @books.by_level(params[:yomiyasusa_level])
    end
    
    # 語数でソート
    case params[:sort]
    when 'word_count_asc'
      @books = @books.order(:word_count)
    when 'word_count_desc'
      @books = @books.order(word_count: :desc)
    when 'level_asc'
      @books = @books.order(:yomiyasusa_level)
    when 'level_desc'
      @books = @books.order(yomiyasusa_level: :desc)
    else
      @books = @books.order(:title)
    end
    
  end

  def show
    @reading_log = current_user&.reading_logs&.find_by(book: @book)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
