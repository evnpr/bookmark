class Profile < ActiveRecord::Base
    has_many :sites
    has_many :categories
end
