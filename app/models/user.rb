class User < ActiveRecord::Base
	validates :name,  presence: true
	validates :email, presence: true
	has_many :created_events,  :foreign_key => "creator_id", :class_name => "Event"
	has_many :invites,         :foreign_key => :attendee_id
	has_many :attended_events, through:        :invites

	def upcoming_events
		self.attended_events.where('date >= ?', DateTime.now)
	end

	def previous_events
		self.attended_events.where('date < ?', DateTime.now)
	end
end