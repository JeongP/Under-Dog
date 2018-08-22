class BidingsController < ApplicationController
  before_action :set_biding, only: [:show, :edit, :update, :destroy]

  # GET /bidings
  # GET /bidings.json
  def index
    @bidings = Biding.all
  end

  # GET /bidings/1
  # GET /bidings/1.json
  def show
  end

  # GET /bidings/new
  def new
    @biding = Biding.new
  end

  # GET /bidings/1/edit
  def edit
  end

  # POST /bidings
  # POST /bidings.json
  def create
    @biding = Biding.new(biding_params)

    respond_to do |format|
      if @biding.save
        format.html { redirect_to @biding, notice: 'Biding was successfully created.' }
        format.json { render :show, status: :created, location: @biding }
      else
        format.html { render :new }
        format.json { render json: @biding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bidings/1
  # PATCH/PUT /bidings/1.json
  def update
    respond_to do |format|
      if @biding.update(biding_params)
        format.html { redirect_to @biding, notice: 'Biding was successfully updated.' }
        format.json { render :show, status: :ok, location: @biding }
      else
        format.html { render :edit }
        format.json { render json: @biding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bidings/1
  # DELETE /bidings/1.json
  def destroy
    @biding.destroy
    respond_to do |format|
      format.html { redirect_to bidings_url, notice: 'Biding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biding
      @biding = Biding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biding_params
      params.require(:biding).permit(:price, :success_bid, :post_id, :user_id)
    end
end
