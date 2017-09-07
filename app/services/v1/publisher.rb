module V1
  class Publisher
    # def self.publish(exchange_name, message = {})
    def self.publish(message = {})
      # exchange = channel.fanout("users.#{exchange_name}")
      exchange = channel.fanout(AMQP['exchange'])
      exchange.publish(message.to_json)
    end

    def self.channel
      @channel ||= connection.create_channel
    end

    def self.connection
      @connection ||= Bunny.new.tap do |connection|
        connection.start
      end
    end
  end
end
