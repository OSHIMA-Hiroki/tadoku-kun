class UsersController < ApplicationController
  def index
    @users = User.joins(reading_logs: :book)
                 .select('users.*, COUNT(reading_logs.id) as books_count, SUM(books.word_count_avg) as total_words')
                 .group('users.id')
                 .order('total_words DESC')
                 .limit(50)
    
    # Get statistics separately to avoid SQL issues
    @total_users = @users.length
    @total_words = @users.sum { |u| u.total_words.to_i }
    @total_books = @users.sum { |u| u.books_count.to_i }
  end

  def show
    @user = User.find(params[:id])
    @reading_logs = @user.reading_logs.includes(:book).recent.limit(20)
    @total_words = @user.total_words_read
    @books_count = @user.books_read_count
    
    # 最近の読書活動（過去30日）
    @recent_activity = @user.reading_logs
                           .where('read_at >= ?', 30.days.ago)
                           .includes(:book)
                           .order(read_at: :desc)
    
    # 月別統計
    @monthly_stats = @user.reading_logs
                         .joins(:book)
                         .group_by_month(:read_at, last: 12)
                         .sum('books.word_count_avg')
  end
end