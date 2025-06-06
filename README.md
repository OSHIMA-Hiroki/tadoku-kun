# Tadoku-kun 📚

> Track your extensive reading journey in English with ease.

A Ruby on Rails web application for tracking extensive reading progress in English. Users can record books they've read, track word counts, view community rankings, and visualize their reading progress through beautiful charts and statistics.

## ✨ Features

### 📖 **Extensive Reading Catalog**
- Curated collection of 18 books from SEG (Society of English Grammar) recommended reading list
- YL (Yomiyasusa Level) difficulty ratings from 0.5 to 6.2
- Accurate word counts for precise progress tracking
- Search and filter by title, difficulty level, and word count
- Detailed book information including authors and descriptions

### 👤 **User Management**
- Secure user registration and authentication with Devise
- Custom nickname-based user profiles
- Password recovery and account management
- Responsive design for mobile and desktop

### 📊 **Reading Progress Tracking**
- Mark books as read with automatic word count accumulation
- Personal reading history with completion dates
- Total words read and books completed statistics
- Average words per book calculations
- Recent reading activity tracking (last 30 days)

### 🏆 **Community Features**
- User rankings based on total words read
- Medal system (🥇🥈🥉) for top 3 readers
- Community statistics showing total users, words, and books
- Public user profiles to view others' reading achievements
- Social motivation through friendly competition

### 📈 **Data Visualization**
- Interactive monthly reading progress charts using Chart.js
- Reading statistics dashboard with key metrics
- Visual progress indicators and achievement badges
- Responsive charts that work on all devices

### 🔧 **Technical Features**
- Rails 7.1.5+ with modern Hotwire/Turbo for SPA-like experience
- PostgreSQL database with optimized queries
- Tailwind CSS for responsive, modern UI design
- Chart.js integration for beautiful data visualization
- Comprehensive test coverage with RSpec

## 🛠 Technology Stack

- **Language**: Ruby 3.3.5
- **Framework**: Rails 7.1.5+ with Hotwire/Turbo/Stimulus
- **Database**: PostgreSQL 16
- **Authentication**: Devise
- **Frontend**: Tailwind CSS (CDN), responsive design
- **Charts**: Chartkick + Chart.js + Groupdate
- **JavaScript**: Importmap, Stimulus controllers
- **Testing**: RSpec, FactoryBot, Capybara
- **Code Quality**: RuboCop, Bundle Audit
- **CI/CD**: GitHub Actions

## 🚀 Quick Start

### Prerequisites

- Ruby 3.3.5
- PostgreSQL 16+
- Node.js (for Chart.js and asset management)
- Yarn package manager

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/tadoku-kun.git
   cd tadoku-kun
   ```

2. **Install dependencies**
   ```bash
   bundle install
   yarn install
   ```

3. **Setup database with seed data**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed  # Loads 18 SEG recommended books
   ```

4. **Start the development server**
   ```bash
   bin/rails server
   ```

5. **Visit the application**
   Open [http://localhost:3000](http://localhost:3000) in your browser

## 📱 How to Use

### Getting Started
1. **Create an account** - Register with your email, nickname, and password
2. **Browse the book catalog** - Explore 18 carefully selected books from YL 0.5 to 6.2
3. **Filter and search** - Find books by difficulty level, word count, or title
4. **View book details** - See word counts, authors, and difficulty ratings

### Tracking Your Reading
1. **Mark books as read** - Click "読了として記録" on any book page
2. **View your progress** - Check your reading history at `/reading_logs`
3. **Monitor statistics** - See total words read, books completed, and averages
4. **Track recent activity** - View your reading activity from the last 30 days

### Community Features
1. **Check rankings** - Visit `/users` to see the community leaderboard
2. **View user profiles** - Click any user's name to see their reading achievements
3. **Explore charts** - See monthly reading progress with interactive graphs
4. **Compare progress** - See how you rank among other readers

### Key Pages
- **Home (`/`)** - Book catalog with search and filters
- **Reading Logs (`/reading_logs`)** - Your personal reading history and stats
- **Rankings (`/users`)** - Community leaderboard and statistics
- **User Profiles (`/users/:id`)** - Individual user achievements and charts
- **Book Details (`/books/:id`)** - Detailed book information and reading actions

## 🔧 Development

### Running Tests
```bash
# Run all tests
bundle exec rspec

# Run specific test files
bundle exec rspec spec/models/
bundle exec rspec spec/controllers/
bundle exec rspec spec/requests/

# Run with coverage
COVERAGE=true bundle exec rspec
```

### Code Quality & Linting
```bash
# Run RuboCop linting
bundle exec rubocop

# Auto-fix simple issues
bundle exec rubocop -a

# Security audit
bundle exec bundle-audit check --update
```

### Database Operations
```bash
bin/rails db:reset      # Reset with fresh seed data (18 books)
bin/rails db:migrate    # Run pending migrations
bin/rails db:seed       # Load seed data only
bin/rails db:rollback   # Rollback last migration

# Check database status
bin/rails db:version
bin/rails db:seed:replant  # Reset and re-seed
```

### Asset Management
```bash
# Install JavaScript dependencies
yarn install

# Add new JavaScript packages via importmap
bin/importmap pin <package-name>

# Precompile assets for production
bin/rails assets:precompile
```

### Debugging & Console
```bash
# Rails console
bin/rails console

# View routes
bin/rails routes

# View database schema
bin/rails db:schema:dump
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository** and clone your fork
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Make your changes** following our coding standards
4. **Add tests** for new functionality (RSpec for models/controllers)
5. **Run the test suite** (`bundle exec rspec`)
6. **Run code quality checks** (`bundle exec rubocop`)
7. **Update documentation** if needed
8. **Commit your changes** with clear, descriptive messages
9. **Push to your branch** (`git push origin feature/amazing-feature`)
10. **Open a Pull Request** with a detailed description

### Development Guidelines

- Follow Rails conventions and best practices
- Write comprehensive tests for new features
- Use RuboCop for code style consistency
- Update CLAUDE.md if adding new development context
- Ensure accessibility and responsive design
- Test chart functionality across different browsers

### Areas for Contribution

- 📊 Enhanced data visualization and analytics
- 🎯 Reading goal setting and achievement system
- 📱 Mobile app development (React Native/Flutter)
- 🌐 Internationalization (i18n) support
- 📚 Additional book catalogs and reading lists
- 🔍 Advanced search and recommendation features
- 📈 Performance optimizations
- 🧪 Additional test coverage

## 📊 Project Statistics

- **Models**: 3 (User, Book, ReadingLog)
- **Controllers**: 4 (Application, Books, ReadingLogs, Users)
- **Views**: 8+ responsive pages with Tailwind CSS
- **Seed Data**: 18 books from SEG recommended reading list
- **Test Coverage**: RSpec test suite with FactoryBot
- **Database**: PostgreSQL with optimized queries
- **Charts**: Interactive Chart.js visualizations

## 📚 Data Source & Methodology

The application uses carefully curated data from the **SEG (Society of English Grammar) recommended reading list**, which provides:

- **YL (Yomiyasusa Level)** ratings from 0.5 to 6.2 for accurate difficulty assessment
- **Precise word counts** for each book to enable accurate progress tracking
- **Quality selection** of books suitable for extensive reading methodology
- **Progressive difficulty** allowing users to gradually increase reading complexity

### Extensive Reading Principles

Tadoku-kun supports the extensive reading approach:
- Read materials at or below your comfort level
- Focus on quantity over intensive analysis
- Skip unknown words to maintain reading flow
- Track progress to stay motivated
- Build reading fluency through volume

## 🚀 Deployment

### Environment Variables
```bash
# Required for production
RAILS_MASTER_KEY=your_master_key
DATABASE_URL=postgresql://user:password@host:port/database
RAILS_ENV=production
```

### Production Setup
```bash
# Precompile assets
bin/rails assets:precompile

# Run database migrations
bin/rails db:migrate

# Load seed data
bin/rails db:seed
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support & Community

If you encounter any issues or have questions:

- 📝 [Create an issue](https://github.com/your-username/tadoku-kun/issues) for bugs or feature requests
- 💬 [Join discussions](https://github.com/your-username/tadoku-kun/discussions) for general questions
- 📧 Contact the maintainers for security issues
- 🌟 Star the repository if you find it useful!

### Reporting Bugs

When reporting bugs, please include:
- Ruby and Rails versions
- Browser and OS information
- Steps to reproduce the issue
- Expected vs actual behavior
- Screenshots if applicable

---

## 🎉 Acknowledgments

- **SEG (Society of English Grammar)** for the curated reading list
- **Rails community** for excellent documentation and tools
- **Chart.js** for beautiful data visualization
- **Tailwind CSS** for responsive design utilities
- **Contributors** who help improve this project

**Happy Reading! 📖✨**