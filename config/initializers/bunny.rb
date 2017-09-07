# bunny = Bunny.new
# bunny.start
# channel = bunny.create_channel
# exchange = channel.topic('backlogg', auto_delete: true)

# channel.queue('users.create', auto_delete: true).bind(exchange, routing_key: 'users.create').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Creating #{payload}"
#   V1::CreateWorker
# end

# channel.queue('users.destroy', auto_delete: true).bind(exchange, routing_key: 'users.destroy').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Destroying #{payload}"
# end

# channel.queue('users.index', auto_delete: true).bind(exchange, routing_key: 'users.index').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Indexing #{payload}"
# end

# channel.queue('users.show', auto_delete: true).bind(exchange, routing_key: 'users.show').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Showing #{payload}"
# end

# channel.queue('users.update', auto_delete: true).bind(exchange, routing_key: 'users.update').subscribe do |delivery_info, metadata, payload|
#   puts delivery_info
#   puts metadata
#   puts "Updating #{payload}"
# end

# exchange.publish('hello!', routing_key: 'create')

# sleep 1.0

# bunny.close