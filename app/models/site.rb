class Site < ActiveRecord::Base
    belongs_to :profile
    belongs_to :category

    def category_name(id)
       Category.find(id).title 
    end
end
