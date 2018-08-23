class HomeController < ApplicationController

  def index #로그인전 홈 화면, 안에서 로그인 모달(회원가입 버튼 클릭시 회원가입 폼 모달로 변경)
    
  end
  
  def main #로그인후 메인 페이지
  end
  
  def show 
    
    message = ""
     Blockchain.instance.all_block.each do |b|
      message << Digest::SHA256.hexdigest(b.to_s) + "<br>"
      message << b.to_s + "<hr>"
    end
    message
  end

  def make_wallet
    
      
  end
  def view_all_wallet
    
  end

  def mining
  end

  def tx
    @block_tx = Blockchain.instance.tx(params[:from], params[:to], params[:amount].to_i).to_s
    redirect_to :back
  end
  
  def view_tx

  end
  
  def mypage
    @posts = Post.where(:user_id => current_user.id)
    @coins = Coin.where(:user_id => current_user.id)
  end
  
  def spon_end
    @post = Post.find(params[:post_id])

    @bidings = Biding.where(:post_id => @post.id)
    
    @bidings = @bidings.order("price DESC").limit(params[:coin_left])
    @bidings.each do |biding|
        @user_buyer = User.find(biding.user_id)
        @user_seller = User.find(@post.user_id)
        @coin = Coin.new
        @coin.post_id = @post.id
        @coin.user_id = @user_buyer.id
        @user_buyer.budget -= biding.price
        @user_seller.budget += biding.price 
        @coin.save
        @user_buyer.save
        @user_seller.save
    end
    
    @post.ongoing = false
    @post.save
    redirect_to :back
  end
  
end
