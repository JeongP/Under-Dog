class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
    @players = Player.order("created_at DESC").page params[:page]
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @posts = Post.where(:user_id => @player.user_id).order("created_at DESC").page params[:page]
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    
    @player = Player.new(player_params)
    # 선수 등록한 사람은 한 번만 가능하게
    @user = User.find(current_user.id) 
    @user.register = true
    @user.save
    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    @user = User.find(current_user.id) 
    @user.register = false
    @user.save
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    def newc
      @player = Player.find(params[:player_id])
      @comment = Comment.new
      @comment.content = params[:content]
      @comment.player_id = params[:player_id]
      @comment.email = params[:email]

      
      @comment.save
      @comments=Comment.all
      respond_to do |format|
          format.js
      end 
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :height, :weight, :team, :image1, :image2, :image3, :image4, :video, :user_id, :position)
    end
end
