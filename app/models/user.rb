class User < ApplicationRecord
  has_many :created_events , foreign_key: :creator_id, class_name: 'Event'
  has_many :invitations , foreign_key: :attendee_id 
  has_many :attended_events, through: :invitations, source: :event_attended

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true , length: {minimum:6}
  validates :password, presence: true , length: {minimum:6}

  has_secure_password
  def name_with_initial
  	"#{name}"
  end
  
end
