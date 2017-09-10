# == Schema Information
#
# Table name: contact_tasks
#
#  id                  :integer          not null, primary key
#  belief_id           :integer
#  user_id             :integer
#  target_people_id    :integer
#  scheduled_datetime  :datetime
#  completion_datetime :datetime
#  body                :text
#  complete            :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ContactTask < ApplicationRecord
    
    belongs_to :user
    belongs_to :belief
    belongs_to :target_people, :class_name => "TargetPerson"
    
    #VALIDATIONS - not sure where this goes, here or below?
    validates :body, presence: true
    validates :user_id, :belief_id, :target_people_id, presence: true, on: :create
    validates :boolean_complete, exclusion: { in: [nil] } #intended to ensure :complete isn't nil, but false or true. I wonder if I've set
    #this up to not let it be nil?
end
