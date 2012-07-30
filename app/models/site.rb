class Site < ActiveRecord::Base
    belongs_to :profile
    belongs_to :category

    def category_name
       if(!Category.find(self.category_id).nil?) 
            Category.find(self.category_id).title 
       end
    end
end
