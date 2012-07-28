class Site < ActiveRecord::Base
    belongs_to :profile
    belongs_to :category
end
