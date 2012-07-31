class Site < ActiveRecord::Base
    belongs_to :profile
    belongs_to :category

    def category_name
        if Category.exists?(self.category_id)
            model = Category.find(self.category_id)
            model.title
        end
    end
end
