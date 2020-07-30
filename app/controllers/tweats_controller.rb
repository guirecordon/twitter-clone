class TweatsController < ApplicationController
  before_action :set_tweat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /tweats
  # GET /tweats.json
  def index
    @tweats = Tweat.all.order("created_at DESC")
    @tweat = Tweat.new
  end

  # GET /tweats/1
  # GET /tweats/1.json
  def show
  end

  # GET /tweats/new
  def new
    @tweat = current_user.tweats.build
  end

  # GET /tweats/1/edit
  def edit
  end

  # POST /tweats
  # POST /tweats.json
  def create
    @tweat = current_user.tweats.build(tweat_params)

    respond_to do |format|
      if @tweat.save
        format.html { redirect_to root_path, notice: 'tweat was successfully created.' }
        format.json { render :show, status: :created, location: @tweat }
      else
        format.html { render :new }
        format.json { render json: @tweat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweats/1
  # PATCH/PUT /tweats/1.json
  def update
    respond_to do |format|
      if @tweat.update(tweat_params)
        format.html { redirect_to @tweat, notice: 'tweat was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweat }
      else
        format.html { render :edit }
        format.json { render json: @tweat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweats/1
  # DELETE /tweats/1.json
  def destroy
    @tweat.destroy
    respond_to do |format|
      format.html { redirect_to tweats_url, notice: 'tweat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweat
      @tweat = Tweat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweat_params
      params.require(:tweat).permit(:tweat)
    end
end