class Level < ActiveRecord::Base

	validates :permission, :numericality => { :greater_than_or_equal_to => 2 }
end
