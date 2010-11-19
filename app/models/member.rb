class Member < ActiveRecord::Base
	belongs_to :team
	has_many :submissions
	has_many :problems, :through => :submissions
end
