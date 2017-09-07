module V1

  class DestroyWorker < ApplicationWorker

    from_queue AMQP['queues']['destroy']

    def work(message)
      puts "Destroying #{message}"
      ack!
    end

  end

end