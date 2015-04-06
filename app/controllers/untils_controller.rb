class UntilsController < ApplicationController
  before_action :set_until, only: [:show, :edit, :update, :destroy]

  # GET /untils
  # GET /untils.json
  def index
    @untils = Until.all
  end

  # GET /untils/1
  # GET /untils/1.json
  def show
  end

  # GET /untils/new
  def new
    @until = Until.new
  end

  # GET /untils/1/edit
  def edit
  end

  # POST /untils
  # POST /untils.json
  def create
    @until = Until.new(until_params)

    respond_to do |format|
      if @until.save
        format.html { redirect_to @until, notice: 'Until was successfully created.' }
        format.json { render :show, status: :created, location: @until }
      else
        format.html { render :new }
        format.json { render json: @until.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /untils/1
  # PATCH/PUT /untils/1.json
  def update
    respond_to do |format|
      if @until.update(until_params)
        format.html { redirect_to @until, notice: 'Until was successfully updated.' }
        format.json { render :show, status: :ok, location: @until }
      else
        format.html { render :edit }
        format.json { render json: @until.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /untils/1
  # DELETE /untils/1.json
  def destroy
    @until.destroy
    respond_to do |format|
      format.html { redirect_to untils_url, notice: 'Until was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_until
      @until = Until.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def until_params
      params.require(:until).permit(:rule_id)
    end
end
