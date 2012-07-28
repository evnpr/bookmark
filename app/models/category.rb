class Category < ActiveRecord::Base
    belongs_to :profile
    has_many :sites
end
