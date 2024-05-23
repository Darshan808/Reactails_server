# Use an official Ruby runtime as a parent image
FROM ruby:3.2.3

# Set the working directory in the container
WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Expose port 3000 to the Docker host (only for docs, runs even if not written)
EXPOSE 3000

# Copy entrypoint script
COPY ./bin/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Expose port 3000 to the Docker host (only for docs, runs even if not written)
EXPOSE 3000

# Set entrypoint script
ENTRYPOINT ["entrypoint.sh"]

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
