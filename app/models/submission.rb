class Submission < ActiveRecord::Base
	belongs_to :member
	belongs_to :problem
	belongs_to :team
end
