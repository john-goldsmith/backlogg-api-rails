namespace :rabbitmq do
  desc "Setup routing"
  task setup: :environment do
    require 'bunny'

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    # get or create exchange
    x = ch.fanout('backlogg.api.users')

    # get or create queue (note the durable setting)
    ch.queue('backlogg.api.users.create', durable: true).bind('backlogg.api.users')
    ch.queue('backlogg.api.users.destroy', durable: true).bind('backlogg.api.users')
    ch.queue('backlogg.api.users.index', durable: true).bind('backlogg.api.users')
    ch.queue('backlogg.api.users.show', durable: true).bind('backlogg.api.users')
    ch.queue('backlogg.api.users.update', durable: true).bind('backlogg.api.users')

    conn.close
  end
end
