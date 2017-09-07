module V1

  class CreateWorker < ApplicationWorker

    from_queue AMQP['queues']['create'],
               durable: true
               ack: true,
               prefetch: 100,
               routing_key: 'users.create'

    def work(message)
      puts "Creating #{message}"
      ack!
    end

  end

end