class RolesUsers < ActiveRecord::Base
  has_one :role
  has_one :user
end