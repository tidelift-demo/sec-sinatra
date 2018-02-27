# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.5.0"

git_source :github do |repo_name|
  "git@github.com:#{repo_name}.git"
end

gem "activesupport"
gem "jwt"
gem "puma"
gem "sinatra"
gem "sinatra-contrib"
gem "private_address_check"
gem "g"
group :development, :test do
  gem "minitest"
  gem "pry"
  gem "rack-test"
  gem "rake"
  gem "rspec"
  gem "rubocop"
  gem "simplecov"
end
