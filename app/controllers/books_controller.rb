class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_book, only: [:show]

  def index
    @books = Book.includes(:reading_logs)
    
    # 検索機能
    if params[:search].present?
      @books = @books.search_by_title(params[:search])
    end
    
    # YLレベルでフィルタ（範囲対応）
    if params[:yl_min].present? || params[:yl_max].present?
      yl_min = params[:yl_min].present? ? params[:yl_min].to_f : 0.0
      yl_max = params[:yl_max].present? ? params[:yl_max].to_f : 10.0
      @books = @books.by_yl_range(yl_min, yl_max)
    end
    
    # 語数でフィルタ（範囲対応）
    if params[:word_count_min].present? || params[:word_count_max].present?
      word_min = params[:word_count_min].present? ? params[:word_count_min].to_i : 0
      word_max = params[:word_count_max].present? ? params[:word_count_max].to_i : 999999
      @books = @books.by_word_count_range(word_min, word_max)
    end
    
    # ソート
    case params[:sort]
    when 'word_count_asc'
      @books = @books.order(:word_count_avg)
    when 'word_count_desc'
      @books = @books.order(word_count_avg: :desc)
    when 'level_asc'
      @books = @books.order(:yl_min)
    when 'level_desc'
      @books = @books.order(yl_max: :desc)
    else
      @books = @books.order(:title)
    end
    
  end

  def show
    @reading_logs = current_user&.reading_logs&.where(book: @book) || []
    @times_read = @reading_logs.count
  end

  def search
    @search_query = params[:query]&.strip
    @search_results = []
    
    if @search_query.present?
      @search_results = search_book_information(@search_query)
    end
  end

  def new
    @book = Book.new
    @search_query = params[:query]
    @book_data = params[:book_data]&.permit(:title, :author, :yl, :word_count)
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save
      redirect_to @book, notice: '本が正常に追加されました！'
    else
      @search_query = params[:query]
      @book_data = params[:book_data]
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :yomiyasusa_level, :word_count, :isbn)
  end

  def search_book_information(query)
    BookSearchService.search(query)
  end
end
