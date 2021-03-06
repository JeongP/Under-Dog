  require 'singleton'

class Blockchain
 include Singleton

  def initialize
    @chain, @wallet, @tx = [], {}, []
  end
    attr_accessor :data
  def mining
    begin  #nonce값 생성
      nonce  = rand(10000000)
      hashed = Digest::SHA256.hexdigest(nonce.to_s)
    end while hashed[0..4] != "00000"

    last_block = @chain[-1]
    normal_txs = []
    @tx.each do |t|
      from, to, amount, post_id = t["sender"], t["recv"], t["total_amount"], t["post_id"]
      if @wallet[from].to_i >= amount.to_i
        @wallet[from] = @wallet[from].to_i - amount.to_i
        @wallet[to] = @wallet[to].to_i + amount.to_i
        normal_txs << t
      end
    end

    block = {
      "index" => @chain.size + 1,
      "nonce" => nonce,
      "time" => Time.now.to_s,
      "previous_block" => Digest::SHA256.hexdigest(last_block.to_s),
      "txs" => normal_txs,
    }
    @tx = []
    @chain << block
    @chain    #화면출력용
  end

  def make_wallet
    wallet = SecureRandom.uuid.gsub("-", "")
    @wallet[wallet] = 50000000
    wallet #화면출력
  end
  
  def view_all_wallet
      @wallet
    end

  def all_block; @chain; end;
      
  def all_tx; @tx; end;

  def tx(from, to, amount, post_id)
    if @wallet[from].nil?
      tx = {"sender"=>from, "recv" => to, "total_amount" => "보내는 사람 지갑이 없습니다.","post_id"=>post_id}
      @tx << tx
      @tx
    elsif @wallet[to].nil?
       tx = {"sender"=>from, "recv" => to, "total_amount" => "받는 사람이 없습니다.","post_id"=>post_id}
       @tx << tx
       @tx
    elsif @wallet[from].to_f < amount.to_f
       tx = {"sender"=>from, "recv" => to, "total_amount" => "잔액이 부족합니다.","post_id"=>post_id}
       @tx << tx
       @tx
    else
      tx = { "sender" => from, "recv" => to, "total_amount" => amount, "post_id"=>post_id }
      @tx << tx
      @tx
    end
  end

end
