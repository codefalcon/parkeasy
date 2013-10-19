class UserInfo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :is_admin, :is_trusted, :proof_id, :proof_type_id
  validates_presence_of :proof_id, :proof_type_id
end
