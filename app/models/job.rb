class Job < ActiveRecord::Base
	belongs_to :start_user, class_name: 'user'
	belongs_to :end_user, class_name: 'user'
end
