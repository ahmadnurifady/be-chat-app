# Use an official Ruby runtime as a parent image
FROM ruby:3.2.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs yarn

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 for local development
EXPOSE 8080

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]