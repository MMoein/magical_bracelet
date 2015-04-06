class Membership < ActiveRecord::Base
	has_one :bracelet
	has_one :group
end
