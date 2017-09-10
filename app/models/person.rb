class Person < ApplicationRecord
    
    has_many :target_persons

    #VALIDATIONS
    validates :first_name, :last_name :linkedin_url, presence: true, on: :create
end
