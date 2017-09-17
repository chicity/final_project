# == Schema Information
#
# Table name: target_organizations
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  org_id         :integer
#  priority_order :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  org_name       :string
#  org_url        :string
#  lessons        :text
#

class TargetOrganization < ApplicationRecord
    
    belongs_to :user
    # belongs_to :org, :class_name => "Organization"
    has_many :beliefs, :foreign_key => "org_id"
    
    #VALIDATIONS
    validates :user_id, :org_name, :org_url, presence: true, on: :create
end
