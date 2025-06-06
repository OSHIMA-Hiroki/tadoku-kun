# CLAUDE.md
必ず日本語で回答してください。
This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Tadoku-kun is a Ruby on Rails web application for tracking extensive reading progress in English. Users can record books they've read, track word counts, view community rankings, and visualize their reading progress.

## Technology Stack

- **Language**: Ruby 3.3.5
- **Framework**: Rails 7.1.5+ with Hotwire/Turbo
- **Database**: PostgreSQL 16
- **Authentication**: Devise
- **Frontend**: Tailwind CSS (via CDN), Stimulus JS
- **Charts**: Chartkick with Chart.js
- **Testing**: RSpec, FactoryBot
- **Code Quality**: RuboCop

## Key Features

- User authentication (login/logout/registration)
- Book catalog with SEG recommended reading list (YL levels)
- Reading log CRUD operations
- User ranking system and profiles
- Monthly reading progress visualization
- Community statistics and leaderboards

## Development Commands

### Server
```bash
bin/rails server                 # Start development server
```

### Database
```bash
bin/rails db:create             # Create databases
bin/rails db:migrate            # Run migrations
bin/rails db:seed               # Load seed data
bin/rails db:reset              # Reset database with fresh data
```

### Testing
```bash
bundle exec rspec               # Run all tests
bundle exec rspec spec/models/  # Run model tests
bundle exec rubocop             # Run code linting
```

### Assets
```bash
yarn install                    # Install JavaScript dependencies
bin/importmap pin <package>     # Add JS packages via importmap
```

## Architecture

### Models
- **User**: Devise authentication, has_many reading_logs
- **Book**: Catalog with title, author, YL level, word_count
- **ReadingLog**: Join table tracking user's completed books

### Controllers
- **BooksController**: Book listing and details
- **ReadingLogsController**: CRUD for reading records
- **UsersController**: Public profiles and rankings

### Key Routes
- `/` - Books index (root)
- `/books/:id` - Book details
- `/reading_logs` - User's reading history
- `/users` - Community rankings
- `/users/:id` - User profile

## Recent Changes
- Fixed logout functionality for Rails 7+ Turbo compatibility
- Implemented user ranking system with charts
- Added Chart.js for reading progress visualization
- Created community statistics and leaderboards

## Known Issues
- None currently identified

## Deployment Notes
- Requires PostgreSQL 16+
- Set RAILS_MASTER_KEY for credentials
- Run assets:precompile for production
- Ensure Chart.js CDN is accessible
