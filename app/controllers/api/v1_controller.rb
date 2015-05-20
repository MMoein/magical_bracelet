class Api::V1Controller < ApplicationController
  # skip_before_filter :verify_authenticity_token, :only => :add_user
  protect_from_forgery with: :null_session
  def trigger
    response = 'error'
    ev = CustomEvent.where(:token => params[:token]).first
    unless ev.nil?
      user = User.where(:email => params[:email]).first
      unless user.nil?
        rule = Rule.where(:user_id => user.id, :custom_events_id => ev.id).first
        unless rule.nil?
          rule.create_notif
          response = 'success'
        end
      end
    end
    respond_to do |format|
      format.json { render json: response }
    end
  end

  def get
    ev = CustomEvent.new
    color = params[:color]
    if  /^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/ =~ color
        token = ev.generate_token
        ev.color= 'FF' + color
        ev.save
    else
      token = 'error'
    end
    respond_to do |format|
      format.json { render json: token }#render as color_code: FF002233
    end
  end
  def add_user
    response = 'error'
    if params[:email]
      user = User.where(:email => params[:email]).first
      unless user.nil?
        req = EventRequest.new
        req.User_id = user.id
        if params[:token]
          ev = CustomEvent.where(:token => params[:token]).first
          unless ev.nil?
            req.CustomEvent_id=ev.id
            req.save
            response = 'success'
          end
        end
      end
    end
    respond_to do |format|
      format.json { render json: response }
    end
  end

end
