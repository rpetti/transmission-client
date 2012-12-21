require 'rubygems'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'transmission-client'

EventMachine.run do
  t = Transmission::Client.new('127.0.0.1', 9091)
  t.get_torrent(1) do |tor|
    puts "#{tor.name} (status: #{tor.status_name}, down: #{tor.rate_download}, up: #{tor.rate_upload}, progress: #{tor.percent_done}%, eta: #{tor.eta_text})"
    EventMachine.stop
  end
end
