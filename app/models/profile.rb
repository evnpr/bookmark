class Profile < ActiveRecord::Base
    has_many :sites
    has_many :categories

    def self.mysite(id)
       Site.where(:profile_id=>id)
    end
end
