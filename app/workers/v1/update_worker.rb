module V1

  class UpdateWorker < ApplicationWorker

    from_queue AMQP['queues']['update']

    def work(message)
      puts "Updating #{message}"
      ack!
    end

  end

end