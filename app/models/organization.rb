class Organization < ApplicationRecord
    
    has_many :target_organizations, :foreign_key => "org_id"
    has_many :beliefs, :foreign_key => "org_id"
    
    #VALIDATIONS
    validates :org_name, :org_url, :target_people_id, presence: true, on: :create
    
end
