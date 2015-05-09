class RulesController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :update, :destroy]

  # GET /rules
  # GET /rules.json
  def index

    @rules = Rule.where(user_id:current_user.id)
    @events = Event.all
  end

  # GET /rules/1
  # GET /rules/1.json
  def show
  end

  # GET /rules/new
  def new
    @events = [1,2,3,4]

  end

  # GET /rules/1/edit
  def edit
  end

  # POST /rules
  # POST /rules.json
  def create
    # if params[:color].nil?
    n = Rule.new
    action = Action.new
    action.color= params[:color]
    action.shake=FALSE
    action.save
    n.action_id = action
    # if n.id?
    n.user_id = current_user.id
    # end
    n.save
    redirect_to '/rules'

    # @rule = Rule.new(rule_params)

    # respond_to do |format|
    #   if @rule.save
    #     format.html { redirect_to @rule, notice: 'Rule was successfully created.' }
    #     format.json { render :show, status: :created, location: @rule }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @rule.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /rules/1
  # PATCH/PUT /rules/1.json
  def update
    respond_to do |format|
      if @rule.update(rule_params)
        format.html { redirect_to @rule, notice: 'Rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @rule }
      else
        format.html { render :edit }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @rule.destroy
    respond_to do |format|
      format.html { redirect_to rules_url, notice: 'Rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule
      @rule = Rule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_params
      params.require(:rule).permit(:bracelet_id, :action_id, :event_id, :until_id)
    end
end
