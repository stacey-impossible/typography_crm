# frozen_string_literal: true

$redis = Redis.new(host: ENV.fetch('REDIS_HOST'), port: ENV.fetch('REDIS_PORT'))
