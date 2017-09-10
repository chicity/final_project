class Belief < ApplicationRecord
    
    belongs_to :user
    belongs_to :org, :class_name => "Organization"
    has_many :target_persons
    has_many :tasks, :class_name => "ContactTask"
    has_many :schedule_tasks
    has_many :prep_tasks
    has_many :meet_tasks
    has_many :review_tasks
    
 #VALIDATIONS  
  validates :body, presence: true
  validates :user_id, :org_id, presence: true, on: :create
  validates :boolean_confirmed_status, exclusion: { in: [nil] } #intended to ensure confirmed_status isn't nil, but false or true. I wonder if I've set
  #this up to not let it be nil?
  
end
