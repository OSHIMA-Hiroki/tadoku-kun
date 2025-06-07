# Tadoku-kun 📚
英語多読の進捗を簡単に記録・管理できるWebアプリケーション

**🌐 本番環境: [https://tadoku-kun.onrender.com](https://tadoku-kun.onrender.com)**

Ruby on Railsで開発された英語多読進捗管理アプリケーションです。読んだ本の記録、語数の追跡、コミュニティランキングの確認、美しいグラフや統計による進捗の可視化ができます。

## ✨ 主な機能

### 📖 **多読図書カタログ**
- SEG（Society of English Grammar）推薦図書リストから厳選された図書コレクション
- YL（読みやすさレベル）0.5～6.2の難易度評価、範囲指定（例：0.8-1.4）にも対応
- 語数の正確な値と範囲（例：700-1500語）の両方をサポート
- タイトル、YL範囲、語数範囲による高度な検索・フィルター機能
- 著者、シリーズ情報、説明を含む詳細な図書情報
- 「Oxford Bookworms」や「Penguin Readers」などのシリーズ図書に対応
- **動的図書追加機能** - データベース検索優先で、見つからない場合のみ新規登録
- **図書管理機能** - ユーザーによる図書情報の追加・編集・削除

### 👤 **ユーザー管理**
- Deviseによる安全なユーザー登録・認証システム
- ニックネーム ベースのカスタムユーザープロフィール
- パスワード復旧とアカウント管理
- モバイル・デスクトップ対応のレスポンシブデザイン

### 📊 **読書進捗管理**
- 平均値を使用した自動語数累積による読了記録
- **多読サポート** - 同じ本を何度でも読み、それぞれが進捗にカウント
- 完了日と再読追跡による個人読書履歴
- スマートな範囲計算による総語数と完読図書数の統計
- 1冊あたりの平均語数計算
- 最近の読書活動追跡（過去30日間）
- タイムスタンプ付きの全読書履歴表示

### 🏆 **コミュニティ機能**
- 総読語数に基づくユーザーランキング
- 上位3名へのメダルシステム（🥇🥈🥉）
- 総ユーザー数、語数、図書数を表示するコミュニティ統計
- 他ユーザーの読書実績を閲覧できる公開プロフィール
- フレンドリーな競争による読書モチベーション向上

### 📈 **データ可視化**
- Chart.jsを使用したインタラクティブな月次読書進捗グラフ
- 主要指標を表示する読書統計ダッシュボード
- 視覚的な進捗インジケーターと達成バッジ
- 全デバイスで動作するレスポンシブグラフ

### 🔧 **技術的特徴**
- SPA風エクスペリエンスのためのRails 7.1.5+とHotwire/Turbo
- 最適化されたクエリを持つPostgreSQLデータベース
- レスポンシブでモダンなUIデザインのTailwind CSS
- 美しいデータ可視化のためのChart.js統合
- RSpecによる包括的なテストカバレッジ

## 🛠 技術スタック

- **言語**: Ruby 3.3.5
- **フレームワーク**: Rails 7.1.5+ with Hotwire/Turbo/Stimulus
- **データベース**: PostgreSQL 16
- **認証**: Devise
- **フロントエンド**: Tailwind CSS (CDN), レスポンシブデザイン
- **グラフ**: Chartkick + Chart.js + Groupdate
- **JavaScript**: Importmap, Stimulus controllers
- **テスト**: RSpec, FactoryBot, Capybara
- **コード品質**: RuboCop, Bundle Audit
- **CI/CD**: GitHub Actions

## 🚀 クイックスタート

### 必要な環境

- Ruby 3.3.5
- PostgreSQL 16+
- Node.js (Chart.jsとアセット管理用)
- Yarn パッケージマネージャー

### インストール

1. **リポジトリをクローン**
   ```bash
   git clone https://github.com/OSHIMA-Hiroki/tadoku-kun.git
   cd tadoku-kun
   ```

2. **依存関係をインストール**
   ```bash
   bundle install
   yarn install
   ```

3. **シードデータでデータベースをセットアップ**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails books:import  # book_info.jsonから図書データをインポート
   ```

4. **開発サーバーを起動**
   ```bash
   bin/rails server
   ```

5. **アプリケーションにアクセス**
   ブラウザで [http://localhost:3000](http://localhost:3000) を開く
   
   または本番環境 **[https://tadoku-kun.onrender.com](https://tadoku-kun.onrender.com)** をお試しください

## 📱 使い方

### はじめに
1. **アカウント作成** - [tadoku-kun.onrender.com](https://tadoku-kun.onrender.com) でメール、ニックネーム、パスワードを登録
2. **図書カタログを閲覧** - YL 0.5～6.2の厳選された図書を探索
3. **フィルター・検索** - YL範囲、語数範囲、タイトルで図書を検索
4. **図書詳細を確認** - 語数（範囲含む）、著者、難易度評価を確認

### 読書記録の管理
1. **読了記録** - 図書ページで「読了として記録」をクリック
2. **再読記録** - 「再読として記録」で同じ本の複数回読書を記録
3. **進捗確認** - `/reading_logs` で読書履歴をチェック
4. **統計監視** - 総読語数、完読図書数、平均値を確認（スマート範囲平均計算）
5. **最近の活動追跡** - 過去30日間の読書活動を表示
6. **履歴管理** - 必要に応じて個別の読書記録を削除

### 図書管理機能
1. **図書検索** - 「本を検索・追加」で既存図書を優先検索
2. **新規追加** - 見つからない場合のみ新しい図書を追加
3. **情報編集** - 図書の詳細情報を編集・更新
4. **図書削除** - 不要な図書データを削除

### コミュニティ機能
1. **ランキング確認** - `/users` でコミュニティリーダーボードを表示
2. **ユーザープロフィール閲覧** - ユーザー名をクリックして読書実績を確認
3. **グラフ閲覧** - インタラクティブなグラフで月次読書進捗を表示
4. **進捗比較** - 他の読者との順位を比較

### 主要ページ
- **ホーム (`/`)** - 検索・フィルター付き図書カタログ
- **読書ログ (`/reading_logs`)** - 個人の読書履歴と統計
- **ランキング (`/users`)** - コミュニティリーダーボードと統計
- **ユーザープロフィール (`/users/:id`)** - 個人の実績とグラフ
- **図書詳細 (`/books/:id`)** - 詳細な図書情報と読書アクション
- **図書検索・追加 (`/search_books`)** - 図書検索と新規追加

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
bin/rails db:reset      # Reset with fresh seed data (22 books)
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
- **Seed Data**: 22 books from SEG recommended reading list with range support
- **Test Coverage**: RSpec test suite with FactoryBot
- **Database**: PostgreSQL with optimized queries
- **Charts**: Interactive Chart.js visualizations

## 📚 データソースと方法論

本アプリケーションは **SEG（Society of English Grammar）推薦図書リスト** から厳選されたデータを使用しており、以下を提供します：

- **YL（読みやすさレベル）** 0.5～6.2の正確な難易度評価
- **正確な語数** 各図書の正確な進捗追跡を可能にする
- **品質の高い選書** 多読方法論に適した図書の選定
- **段階的難易度** ユーザーが徐々に読書の複雑さを増加できる

### 多読の原則

Tadoku-kunは多読アプローチをサポートします：
- 自分のレベル以下の教材を読む
- 精読よりも量を重視
- 読書の流れを維持するため未知語はスキップ
- モチベーション維持のための進捗追跡
- 量を通じた読書流暢性の構築

## 🚀 デプロイメント

**本番環境**: [https://tadoku-kun.onrender.com](https://tadoku-kun.onrender.com)

### 環境変数
```bash
# 本番環境に必要
RAILS_MASTER_KEY=your_master_key
DATABASE_URL=postgresql://user:password@host:port/database
RAILS_ENV=production
RAILS_SERVE_STATIC_FILES=true
```

### 本番環境セットアップ
```bash
# アセットをプリコンパイル
bin/rails assets:precompile

# データベースマイグレーションを実行
bin/rails db:migrate

# 図書データをインポート
bin/rails books:import
```

### デプロイメントプラットフォーム

このアプリケーションは **Render** で正常にデプロイされています：
- GitHubからの自動デプロイメント
- PostgreSQLデータベース
- SSL/HTTPS有効
- 環境変数管理
- ゼロダウンタイムデプロイメント

他のプラットフォームでのデプロイメント：
- **Railway**: 自動検出によるシンプルなデプロイメント
- **Heroku**: アドオンエコシステムを持つクラシックプラットフォーム
- **DigitalOcean App Platform**: スケーラブルなコンテナベースデプロイメント

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support & Community

If you encounter any issues or have questions:

- 📝 [Create an issue](https://github.com/OSHIMA-Hiroki/tadoku-kun/issues) for bugs or feature requests
- 💬 [Join discussions](https://github.com/OSHIMA-Hiroki/tadoku-kun/discussions) for general questions
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

---

## 🆕 最新のアップデート

### バージョン 3.0.0 の機能
- **動的図書管理システム**: 既存図書優先検索と新規図書追加機能
- **図書データベース拡張**: JSON形式による図書データインポート機能
- **Nullable フィールド対応**: author、isbn、word_countのnull値許容
- **改良された図書検索UI**: 既存図書と新規作成の明確な区別
- **包括的図書管理**: ユーザーによる図書の追加・編集・削除機能

### 以前のバージョン（2.0.0）の機能
- **YL・語数範囲対応**: "YL 0.8-1.4"や"700-1500語"などの範囲指定サポート
- **多読サポート**: 同じ本の複数回読書と完全な追跡
- **拡張検索**: YL範囲と語数範囲によるフィルター
- **本番デプロイメント**: [tadoku-kun.onrender.com](https://tadoku-kun.onrender.com) でライブアプリ利用可能
- **スマート統計**: 範囲ベース図書の自動平均計算
- **UI改善**: ボタン機能の向上とレスポンシブデザイン
- **シリーズサポート**: Oxford BookwormsやPenguin Readersなどの図書シリーズ対応

### バグ修正
- 本番環境でのログアウト機能修正
- 全環境での「読了として記録」ボタン信頼性向上
- 本番環境安定性向上のためのフォーム送信処理改善
- 多読サポートのためのデータベース制約強化

**Happy Reading! 📖✨**
