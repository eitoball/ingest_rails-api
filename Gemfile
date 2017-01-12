source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

gem 'activerecord-postgis-adapter'
gem 'pg'
gem 'puma'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end
