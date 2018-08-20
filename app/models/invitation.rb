class Invitation < ApplicationRecord
	belongs_to :attendee , class_name: 'User'
	belongs_to :event_attended,foreign_key: :attended_event_id, class_name: 'Event'
end
