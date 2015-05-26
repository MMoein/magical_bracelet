class AppController < ApplicationController
  def getAction
    # notifications = Notif.joins(:rule).merge(Rule.where(:user_id => current_user.id))
    # @shit = 'hell no!'
    # n = notifications.first
    # @n = current_user.rules.joins(:notifs).merge(Notif.all).first
    rules = Rule.where(:user_id => current_user.id)
    notif = nil
    rules.each do |rule|
      notif = Notif.where(:rule_id=>rule.id, :is_consumed =>nil).first
      unless notif.nil?
        break
      end
    end
    #notifs = Notif.where(:)#joins("LEFT JOIN rules ON rules.user_id = #{current_user.id}")
    color = nil
    unless notif.nil?
      color = Action.find(Rule.find(notif.rule_id).action_id).colour
    end
    #notifs.each do |n|
    #  unless n.is_consumed?
    #    color = Action.find(Rule.find(n.rule_id).action_id).colour
    #    n.is_consumed = TRUE
    #    n.save
    #    break
    #  end
    #end
    @n = color
    respond_to do |format|
      format.html
      format.json { render json: [color] }#render as color_code: FF002233
      end
  end
  def requests
    @ev = EventRequest.where(:User_id => current_user.id, :is_used => nil).first

  end
  def decide

    if params[:Accept]

      ev_req = EventRequest.find(Integer(params[:ev_id]))
      if ev_req.User_id == current_user.id
        ev = CustomEvent.find(ev_req.CustomEvent_id)
        rule = Rule.new
        rule.custom_events_id = ev.id
        action = Action.new
        action.colour = ev.color
        action.save
        rule.user_id = current_user.id
        rule.action_id = action.id
        rule.save
        ev_req.is_used = true
        ev_req.save

      end
    else
      ev_req = EventRequest.find(Integer(params[:ev_id]))
      if ev_req.User_id == current_user.id
        ev_req.is_used= true
        ev_req.save
      end
    end
    redirect_to '/'

  end

end
