class Invitation < ApplicationRecord
	belongs_to :attendee , class_name: 'User'
	belongs_to :event_attended,foreign_key: :attended_event_id, class_name: 'Event'

	

	def self.already_invited(user,event)
		self.where("attendee_id = ? and attended_event_id=?",user.id,event.id).any?
	end


	
end
