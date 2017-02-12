class BlackScholesController < ApplicationController
  before_action :set_black_schole, only: [:show, :edit, :update, :destroy]

  # GET /black_scholes
  # GET /black_scholes.json
  def index
    @black_scholes = BlackSchole.all
  end

  # GET /black_scholes/1
  # GET /black_scholes/1.json
  def show
  end

  # GET /black_scholes/new
  def new
    @black_schole = BlackSchole.new
  end

  # GET /black_scholes/1/edit
  def edit
  end

  # POST /black_scholes
  # POST /black_scholes.json
  def create
    @black_schole = BlackSchole.new(black_schole_params)
   
    respond_to do |format|
      if @black_schole.save
        stock_price = params[:black_schole]
        @result = BlackSchole.black_scholes(stock_price[:call_put_flag], stock_price[:stock_price].to_f, stock_price[:strike_price].to_f, stock_price[:time].to_f, stock_price[:interest_rate].to_f, stock_price[:volatility].to_f)
        @black_schole.update_attributes(c: @result[:c], p: @result[:p], d1: @result[:d1], d2: @result[:d2])
        format.html { redirect_to black_scholes_path, notice: 'Black schole was successfully created.' }
        format.json { render :show, status: :created, location: @black_schole }
      else
        format.html { render :new }
        format.json { render json: @black_schole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /black_scholes/1
  # PATCH/PUT /black_scholes/1.json
  def update
    respond_to do |format|
      if @black_schole.update(black_schole_params)
        format.html { redirect_to @black_schole, notice: 'Black schole was successfully updated.' }
        format.json { render :show, status: :ok, location: @black_schole }
      else
        format.html { render :edit }
        format.json { render json: @black_schole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /black_scholes/1
  # DELETE /black_scholes/1.json
  def destroy
    @black_schole.destroy
    respond_to do |format|
      format.html { redirect_to black_scholes_url, notice: 'Black schole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate_black_schole
    puts params.inspect
    stock_price = params[:black_schole]
    @result = BlackSchole.black_scholes(stock_price[:call_put_flag], stock_price[:stock_price].to_f, stock_price[:strike_price].to_f, stock_price[:time].to_f, stock_price[:interest_rate].to_f, stock_price[:volatility].to_f)
    
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_black_schole
      @black_schole = BlackSchole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def black_schole_params
      params.require(:black_schole).permit(:stock_price, :strike_price, :interest_rate, :time, :volatility, :call_put_flag, :c, :p, :d1, :d2)
    end
end
