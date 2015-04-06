class BraceletsController < ApplicationController
  before_action :set_bracelet, only: [:show, :edit, :update, :destroy]

  # GET /bracelets
  # GET /bracelets.json
  def index
    @bracelets = Bracelet.all
  end

  # GET /bracelets/1
  # GET /bracelets/1.json
  def show
  end

  # GET /bracelets/new
  def new
    @bracelet = Bracelet.new
  end

  # GET /bracelets/1/edit
  def edit
  end

  # POST /bracelets
  # POST /bracelets.json
  def create
    @bracelet = Bracelet.new(bracelet_params)

    respond_to do |format|
      if @bracelet.save
        #current_user.bracelets << @bracelet
        #current_user.save
        format.html { redirect_to @bracelet, notice: 'Bracelet was successfully created.' }
        format.json { render :show, status: :created, location: @bracelet }
      else
        format.html { render :new }
        format.json { render json: @bracelet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bracelets/1
  # PATCH/PUT /bracelets/1.json
  def update
    respond_to do |format|
      if @bracelet.update(bracelet_params)
        format.html { redirect_to @bracelet, notice: 'Bracelet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bracelet }
      else
        format.html { render :edit }
        format.json { render json: @bracelet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bracelets/1
  # DELETE /bracelets/1.json
  def destroy
    @bracelet.destroy
    respond_to do |format|
      format.html { redirect_to bracelets_url, notice: 'Bracelet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bracelet
      @bracelet = Bracelet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bracelet_params
      params.require(:bracelet).permit(:color, :user_id, :is_shaking)
    end
end
