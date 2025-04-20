# WTFISAI

An educational platform dedicated to helping people understand artificial intelligence, from basics to business applications.

## Features

- Comprehensive learning paths covering AI fundamentals to advanced topics
- Free and premium content
- User progress tracking
- Subscription-based access to premium content
- Responsive design for all devices

## Getting Started

### Prerequisites

- Ruby 3.2.0 or later
- Rails 7.1.0 or later
- PostgreSQL
- Node.js and Yarn

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/wtfisai.git
   cd wtfisai
   ```

2. Install dependencies:
   ```bash
   bundle install
   yarn install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the development server:
   ```bash
   ./bin/dev
   ```

5. Visit `http://localhost:3000` in your browser.

### Environment Variables

Create a `.env` file in the root directory with the following variables:

```
DATABASE_URL=postgresql://localhost/wtfisai_development
RAILS_MASTER_KEY=your_master_key_here
```

## Development

### Running Tests

```bash
rails test
```

### Code Style

This project uses:
- RuboCop for Ruby code style
- ESLint for JavaScript code style
- Prettier for formatting

Run the linters with:
```bash
bundle exec rubocop
yarn lint
```

## Deployment

The application is configured for deployment on Heroku. To deploy:

1. Create a Heroku app:
   ```bash
   heroku create
   ```

2. Set up the database:
   ```bash
   heroku addons:create heroku-postgresql
   ```

3. Deploy:
   ```bash
   git push heroku main
   ```

4. Run migrations:
   ```bash
   heroku run rails db:migrate
   heroku run rails db:seed
   ```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Rails](https://rubyonrails.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Devise](https://github.com/heartcombo/devise)
