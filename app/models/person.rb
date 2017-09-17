# == Schema Information
#
# Table name: people
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  linkedin_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Person < ApplicationRecord
    
    has_many :target_persons

    #VALIDATIONS
    validates :first_name, :last_name, :linkedin_url, presence: true, on: :create
end
