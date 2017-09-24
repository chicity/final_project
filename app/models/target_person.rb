# == Schema Information
#
# Table name: target_people
#
#  id             :integer          not null, primary key
#  person_id      :integer
#  user_id        :integer
#  belief_id      :integer
#  priority_order :integer
#  rationale      :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  first_name     :string
#  last_name      :string
#  linkedin_url   :string
#  email          :string
#  org_name       :string
#  lessons        :text
#

class TargetPerson < ApplicationRecord
    
    belongs_to :user
    belongs_to :belief
    # belongs_to :person
    has_many :contact_tasks, :foreign_key => "target_people_id"
    has_many :schedule_tasks, :foreign_key => "target_people_id"
    has_many :prep_tasks, :foreign_key => "target_people_id"
    has_many :meet_tasks, :foreign_key => "target_people_id"
    has_many :review_tasks, :foreign_key => "target_people_id"
    
    #VALIDATIONS
    # validates :person_id, :user_id, :belief_id, presence: true, on: :create //old validation prior to adding columns to Target_people
    validates :user_id, :belief_id, :first_name, :last_name, :rationale,  presence: true, on: :create
    # validates :linkedin_url, :email, :org_name, :lessons, presence: true // don't want to require these at any time
    validates :priority_order, :numericality => { :only_integer => true, :greater_than_or_equal_to => -100, :less_than_or_equal_to => 100 }

    
    
    
    # below is attempt at defining all variables needed to render the next_step page
    def next_step
    
        @next_step = "Email Tom Hardy about importance of stats analysis in R"
      
        render("https://ide.c9.io/chicity/workdeq/next_step.html.erb")
    end # end of next_step
    
end
