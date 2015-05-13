require 'net/http'

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

    session[:rule_params] ||= {}
    @rule = Rule.new(session[:rule_params])
    @rule.current_step = session[:rule_step]
    @events = [1,2,3,4]
    @step = "event_select"
  end

  # GET /rules/1/edit
  def edit
  end

  # POST /rules
  # POST /rules.json
  def create
    @events = ['weather',]
    session[:event] = params[:event] if params[:event]
    @event = session[:event]
    session[:rule_params].deep_merge!(params[:rule]) if params[:rule]
    @rule = Rule.new(session[:rule_params])
    @rule.current_step = session[:rule_step]
    @types = ['rain', 'sunny', 'cloudy', 'snowy']
    if @rule.current_step == 'event_create' and session[:event] == '1' and not params[:Back]
      city= params[:City]
      country = params[:Country]
      # success = nil
      # while success.nil?
      res = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city},#{country}")
      if res.code == 200
        body = JSON.parse res.body
      end
      if body and (body['cod'] == '404' or res.code != 200)
        # wrong city, country
        @rule.previous_step
        flash[:notice] = 'Invalid city or country'
      else
        ev = WeatherEvent.new
        ev[:city] = city
        ev.country = country
        ev.weather = params[:type]
        ev.save
        session[:event_id] = ev.id
      end
      elsif @rule.current_step == 'action_select'
        action = Action.new
        action.colour = 'FF'+params[:color]
        action.save
        session[:action_id] = action.id
    end
    if params[:Back]
      @rule.previous_step
    elsif @rule.last_step?
      @rule.action_id = session[:action_id]
      if session[:event] == '1'
        @rule.weather_events_id = session[:event_id]
      else
        @rule.event_id = session[:event_id]
      end
      @rule.user_id = current_user.id
      @rule.save
    else
      @rule.next_step
    end
    session[:rule_step] = @rule.current_step
    if @rule.new_record?
      render "new"
    else
      session[:rule_step] = session[:rule_params] = nil
      flash[:notice] = session[:event]
      redirect_to '/rules'
    end
    # if params[:color].nil?
    # n = Rule.new
    # action = Action.new
    # action.color= params[:color]
    # action.shake=FALSE
    # action.save
    # n.action_id = action
    # if n.id?
    # n.user_id = current_user.id
    # end
    # n.save
    # redirect_to '/rules'



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
    # def set_rule
    #   @rule = Rule.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def rule_params
    #   params.require(:rule).permit(:bracelet_id, :action_id, :event_id, :until_id)
    # end
end
