require 'sinatra'
require './block'

blockchain = Blockchain.new

get '/' do 
  message = ""
  blockchain.all_block.each do |b|
    message << Digest::SHA256.hexdigest(b.to_s) + "<br>"
    message << b.to_s + "<hr>"
  end
  message
end

get '/make_wallet' do
  blockchain.make_wallet.to_s
end

get '/mining' do 
  blockchain.mining.to_s
end

get '/tx' do
  blockchain.tx(params["from"], params["to"], params["amount"]).to_s
end
