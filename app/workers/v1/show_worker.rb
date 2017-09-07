module V1

  class ShowWorker < ApplicationWorker

    from_queue AMQP['queues']['show']

    def work(message)
      puts "Showing #{message}"
      ack!
    end

  end

end