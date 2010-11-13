class Member < ActiveRecord::Base
	has_many :submissions
	has_many :problems, :through => :submissions
end
