# CLAUDE.md
必ず日本語で回答してください。
This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Tadoku-kun is a Ruby on Rails web application for tracking extensive reading progress in English. The app helps users record books they've read, automatically calculates total word counts, and visualizes reading progress toward goals.

## Technology Stack

- **Backend**: Ruby 3.x, Ruby on Rails 8 (Hotwire, Turbo, Stimulus)
- **Database**: PostgreSQL 16
- **Authentication**: Devise + Turbo
- **Frontend**: Tailwind CSS, Heroicons
- **Charts**: Chartkick + Groupdate
- **Testing**: RSpec, FactoryBot, RuboCop

## Development Commands

```bash
# Setup
bundle install
yarn install
cp .env.example .env
bin/rails db:create db:migrate db:seed

# Development server
bin/dev  # Runs rails, tailwind, and esbuild concurrently

# Testing
rspec
rubocop
```

## Architecture

The application follows standard Rails conventions with these key features:

- Book database with YL (Yomiyasusa Level) difficulty ratings and word counts
- User authentication for tracking individual reading progress
- Reading log system to record completed books
- Progress visualization and milestone tracking
- SNS sharing functionality for achievements

## Development Phases

The project is being built in phases from basic book listing to advanced features like goal setting and social sharing. Check Issues/Projects for current development status.

## Database Notes

Uses PostgreSQL with JSONB for flexible metadata storage. Initial seed data includes SEG recommended books with word counts and difficulty levels.
