class Event < ApplicationRecord
	belongs_to :creator , class_name: 'User'
	has_many :invitations , foreign_key: :attended_event_id
	has_many :attendees, through: :invitations , source: :attendee

	validates :title, presence: true
	validates :description, presence: true
	validates :date, presence: true

  
  scope :upcoming, ->	{where('date > ?', Time.now ).order('date ASC')}
 

  
  scope :past, ->	{where('date < ?', Time.now ).order('date DESC')}


  
end
