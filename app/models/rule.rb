class Rule < ActiveRecord::Base
	has_many :notifs
	has_one :until
	has_one :event
	has_one :bracelet_action
	belongs_to :group
end
