class TargetPerson < ApplicationRecord
    
    belongs_to :user
    belongs_to :belief
    belongs_to :person
    has_many :tasks, :class_name => "ContactTask", :foreign_key => "target_people_id"
    has_many :schedule_tasks, :foreign_key => "target_people_id"
    has_many :prep_tasks, :foreign_key => "target_people_id"
    has_many :meet_tasks, :foreign_key => "target_people_id"
    has_many :review_tasks, :foreign_key => "target_people_id"
    
    #VALIDATIONS
    validates :person_id, :user_id, :belief_id, presence: true, on: :create
    validates :rationale, presence: true
    
end
