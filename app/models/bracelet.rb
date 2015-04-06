class Bracelet < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :rules
end
