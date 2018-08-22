class Blockchain
  def initialize
    @chain, @wallet, @tx = [], {}, []
  end

  def mining
    begin  #nonce값 생성
      nonce  = rand(10000000)
      hashed = Digest::SHA256.hexdigest(nonce.to_s)
    end while hashed[0..5] != "000000"

    last_block = @chain[-1]
    normal_txs = []
    @tx.each do |t|
      from, to, amount = t["sender"], t["recv"], t["total_amount"]
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
    wallet =  SecureRandom.uuid.gsub("-", "")
    @wallet[wallet] = 1000
    wallet #화면출력
  end

  def all_block; @chain; end;

  def tx(from, to, amount)
    if @wallet[from].nil?
      "보내는 사람 지갑이 없습니다."
    elsif @wallet[to].nil?
      "받는 사람이 없습니다."
    elsif @wallet[from].to_f < amount.to_f
      "잔액이 부족합니다."
    else
      tx = { "sender" => from, "recv" => to, "total_amount" => amount }
      @tx << tx
      @tx
    end
  end
end
