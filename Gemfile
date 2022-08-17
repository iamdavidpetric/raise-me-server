source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "active_model_serializers"
gem "bootsnap", require: false
gem 'devise_token_auth', '>= 1.2.0', git: 'https://github.com/RaziAhmad123/devise_token_auth'
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3"
gem 'omniauth'
gem "rack-cors"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
end

group :development do
  gem 'annotate'
  gem "letter_opener"
end
