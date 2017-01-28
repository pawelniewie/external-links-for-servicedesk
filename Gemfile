ruby '2.3.1'
source 'https://rubygems.org' do
  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'rails', '>= 5.0.0.rc1', '< 5.1'
  gem 'responders'
  # Use postgresql as the database for Active Record
  gem 'pg', '~> 0.18'
  # Use Puma as the app server
  gem 'puma', '~> 3.0'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.0'
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 3.0'
  # Use ActiveModel has_secure_password
  # gem 'bcrypt', '~> 3.1.7'

  # Use Capistrano for deployment
  # gem 'capistrano-rails', group: :development

  # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
  # gem 'rack-cors'

  # Use SCSS for stylesheets
  gem 'sass-rails'

  gem 'react-rails'

  group :development, :test do
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'pry-byebug', platform: :mri
    gem 'rspec-rails'
  end

  group :development do
    gem 'listen', '~> 3.0.5'
    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
    gem 'spring-commands-rspec'
    gem 'dotenv-rails'
    gem 'dotenv-heroku'
  end

  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

  gem 'atlassian-jwt-authentication',
    git: 'https://github.com/pawelniewie/atlassian-jwt-authentication.git',
    branch: 'master',
    require: 'atlassian_jwt_authentication'

  # Mail handling
  gem 'mailgun_rails'
  gem 'roadie-rails'
  gem 'nokogiri'
  gem 'shoryuken'

  gem 'slim'

  gem 'recursive-open-struct'

  gem 'attr_encrypted'

  gem 'addressable'

  gem 'bottled_services', git: 'https://github.com/pawelniewie/bottled_services.git', branch: 'master'

  # LogEntry
  gem 'le'

  gem 'newrelic_rpm'

  # https://github.com/cowboyd/handlebars.rb
  gem 'handlebars'

  gem 'font-awesome-sass', '~> 4.7.0'

  gem 'draper', '~> 3.0.0.pre1'

  gem 'gibbon'

  gem 'rails-commons', git: 'https://github.com/pawelniewie/rails-commons.git', branch: 'master'

  gem 'solid_assert'

  gem 'rails_12factor', group: :production

  gem "bugsnag"

  gem 'activerecord-session_store'
end
