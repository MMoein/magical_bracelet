class Event < ActiveRecord::Base
	has_many :rules
	has_one :until
end
