class BraceletActionsController < ApplicationController
  before_action :set_bracelet_action, only: [:show, :edit, :update, :destroy]

  # GET /bracelet_actions
  # GET /bracelet_actions.json
  def index
    @bracelet_actions = BraceletAction.all
  end

  # GET /bracelet_actions/1
  # GET /bracelet_actions/1.json
  def show
  end

  # GET /bracelet_actions/new
  def new
    @bracelet_action = BraceletAction.new
  end

  # GET /bracelet_actions/1/edit
  def edit
  end

  # POST /bracelet_actions
  # POST /bracelet_actions.json
  def create
    @bracelet_action = BraceletAction.new(bracelet_action_params)

    respond_to do |format|
      if @bracelet_action.save
        format.html { redirect_to @bracelet_action, notice: 'Bracelet action was successfully created.' }
        format.json { render :show, status: :created, location: @bracelet_action }
      else
        format.html { render :new }
        format.json { render json: @bracelet_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bracelet_actions/1
  # PATCH/PUT /bracelet_actions/1.json
  def update
    respond_to do |format|
      if @bracelet_action.update(bracelet_action_params)
        format.html { redirect_to @bracelet_action, notice: 'Bracelet action was successfully updated.' }
        format.json { render :show, status: :ok, location: @bracelet_action }
      else
        format.html { render :edit }
        format.json { render json: @bracelet_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bracelet_actions/1
  # DELETE /bracelet_actions/1.json
  def destroy
    @bracelet_action.destroy
    respond_to do |format|
      format.html { redirect_to bracelet_actions_url, notice: 'Bracelet action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bracelet_action
      @bracelet_action = BraceletAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bracelet_action_params
      params.require(:bracelet_action).permit(:colour, :shake)
    end
end
