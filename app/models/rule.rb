class Rule < ActiveRecord::Base
	has_many :notifs
	has_one :until
	has_one :event
  has_one :weather_event
	has_one :bracelet_action
  has_one :User
	belongs_to :group
  attr_writer :current_step
  def current_step
    @current_step || steps.first
  end
  def create_notif
    notifications = Notif.where(:rule_id => self.id)
    already_exists = false
    notifications.each do |n|
      unless n.is_consumed
        already_exists = true
      end
    end
    if not already_exists
      Notif.create(:rule_id => self.id)
    end
  end

  def steps
    %w[event_select event_create action_select]
  end
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  def first_step?
    current_step == steps.first
  end


  def last_step?
    current_step == steps.last
  end
end
