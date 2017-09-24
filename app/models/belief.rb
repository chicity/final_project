# == Schema Information
#
# Table name: beliefs
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  org_id                 :integer
#  body                   :text
#  priority_order         :integer
#  confirmed_status       :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  lessons                :text
#  target_organization_id :integer
#

class Belief < ApplicationRecord
    
    belongs_to :user
    belongs_to :target_organization
    # , :class_name => "TargetOrganization", :foreign_key => "target_organization_id"
    # belongs_to :org, :class_name => "Organization" //9-17, I'm worried target_organization_id isn't in here. *See above*
    has_many(:target_person, :class_name =>"TargetPerson", :foreign_key => "belief_id")
    has_many :contact_tasks
    # has_many :tasks, :class_name => "ContactTask" //updating to above version to correct from FirstDraft mistake
    has_many :schedule_tasks
    has_many :prep_tasks
    has_many :meet_tasks
    has_many :review_tasks
    
 #VALIDATIONS  
  validates :body, presence: true
  validates :user_id, :target_organization_id, presence: true, on: :create
  validates :priority_order, :numericality => { :only_integer => true, :greater_than_or_equal_to => -100, :less_than_or_equal_to => 100 }
#   validates :boolean_confirmed_status, exclusion: { in: [nil] } #intended to ensure confirmed_status isn't nil, but false or true. I wonder if I've set
  #this up to not let it be nil?
  
end
