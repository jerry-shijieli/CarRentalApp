redis-server&
sidekiq -C config/sidekiq.yml&
bin/rails server -b $IP -p $PORT -e development