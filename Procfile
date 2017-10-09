web: bundle exec rails server -p $PORT
worker: redis-server
worker: bundle exec sidekiq -C config/sidekiq.yml