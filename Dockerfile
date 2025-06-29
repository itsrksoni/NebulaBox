# Use official Ruby image with Debian
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3

# Set working directory inside container
WORKDIR /rails

# Copy Gemfiles first for layer caching
COPY Gemfile* ./

# Install gems
RUN bundle install

# Copy everything else
COPY . .

# Expose default Rails port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]