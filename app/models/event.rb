class Event < ActiveRecord::Base
	validates  :title,       presence: true
	validates  :description, presence: true
	validates  :date,        presence: true
	belongs_to :creator,     :class_name  => "User"
	has_many   :invites,     :foreign_key => :attended_event_id
	has_many   :attendees,   through:        :invites
	scope			 :upcoming,    -> { where('date >= ?', DateTime.now).order('Date ASC') }
	scope      :past,        -> { where('date < ?', DateTime.now).order('Date DESC') }

end
