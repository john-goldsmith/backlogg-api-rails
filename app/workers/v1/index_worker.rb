module V1

  class IndexWorker < ApplicationWorker

    from_queue AMQP['queues']['index']

    def work(message)
      puts "Indexing #{message}"
      ack!
    end

  end

end