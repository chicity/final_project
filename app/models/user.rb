#I believe this is the rb file for Devise (and not admin_user which is for the Active Admin)

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :target_organizations
  has_many :beliefs, :dependent => :destroy
  has_many :target_persons
  has_many :tasks, :class_name => "ContactTask"
  has_many :schedule_tasks, :dependent => :destroy
  has_many :prep_tasks
  has_many :meet_tasks, :dependent => :destroy
  has_many :review_tasks       
  
end
