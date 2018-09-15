class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  
  # GET /coins
  # GET /coins.json
  def index
    @coins = Coin.all
  end

  # GET /coins/1
  # GET /coins/1.json
  def show
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins
  # POST /coins.json
  def create
    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: 'Coin was successfully created.' }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1
  # PATCH/PUT /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to @coin, notice: 'Coin was successfully updated.' }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def buy_coin
    # 거래가 가능한지.
    if params[:total_coin_num].to_i < params[:count].to_i
      
    else
      # 잔고동기화
      seller = User.find(params[:ori_user_id])
      buyer = User.find(params[:new_user_id])
      seller.budget += params[:count].to_i * params[:price].to_i
      seller.save
      buyer.budget -= params[:count].to_i * params[:price].to_i
      buyer.save
      
      # 구매수량만큼 코인테이블에서 코인에 대한 소유자 바꿔주기
      @bidded_post = Coin.where(:post_id => params[:post_id], :user_id => params[:ori_user_id])
      count = 0
      for i in @bidded_post
        if(count < params[:count].to_i)
          i.user_id = params[:new_user_id]
          i.save
          count +=1
        else
          break
        end
      end
    
      # 마켓테이블에서 올린 전체coin갯수에서 팔린 코인 수 빼기.
      market_coin_count = Market.find(params[:id].to_i)
      market_coin_count.count -= params[:count].to_i
      market_coin_count.save
      
      redirect_to :back
    end
    
  end

  # DELETE /coins/1
  # DELETE /coins/1.json
  def destroy
    @coin.destroy
    respond_to do |format|
      format.html { redirect_to coins_url, notice: 'Coin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coin_params
      params.require(:coin).permit(:reward, :post_id, :user_id)
    end
end
