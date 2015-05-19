class AppController < ApplicationController
  def getAction
    # notifications = Notif.joins(:rule).merge(Rule.where(:user_id => current_user.id))
    # @shit = 'hell no!'
    # n = notifications.first
    # @n = current_user.rules.joins(:notifs).merge(Notif.all).first
    notifs = Notif.joins("LEFT JOIN rules ON rules.user_id = #{current_user.id}")
    color = nil
    notifs.each do |n|
      unless n.is_consumed?
        color = Action.find(Rule.find(n.rule_id).action_id).colour
        n.is_consumed = TRUE
        n.save
        break
      end
    end
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
        redirect_to '/'

      end
    end
  end

end
