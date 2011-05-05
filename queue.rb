#
# ruby queue.rb FROM TO
#
# Adds the ids from FROM to TO (inclusive) to the queue.
#

require "rubygems"
require "redis"

redis = Redis.new

from = ARGV[0].to_i
to = ARGV[1].to_i

puts "Queueing #{ from } to #{ to }"
(from..to).each do |id|
  redis.rpush("friendster:queue", id)
end

