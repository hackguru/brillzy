class Catalogue < ActiveRecord::Base
    
    has_many    :pages
    belongs_to       :user
    
    def set_attributes (attributes)
        attributes.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
    end
        
end
