class Page < ActiveRecord::Base
  belongs_to :catalogue
    has_many :tags

    # Root directory of the photo public/photos
    PHOTO_STORE = File.join Rails.root, 'app', 'assets', 'images', 'cat_images'
    
    # Invoke save_photo method when save is completed
    after_save :save_photo
    
    # "f.file_field :load_photo_file" in the view triggers Rails to invoke this method
    # This method only store the information
    # The file saving is done in after_save
    def load_photo_file(data)
        # Record the file extension
        @image_extension = File.extname(data.original_filename)
        # Store the data for later use
        @photo_data = data
    end
    
    # Called when save is completed
    def save_photo
        if @photo_data
            directory_name = File.join PHOTO_STORE, self.catalogue.id.to_s
            Dir.mkdir(directory_name) unless File.exists?(directory_name)
            self.image_url = self.id.to_s + @image_extension
            # Write the data out to a file
            name = File.join directory_name, image_url
            File.open(name, 'wb') do |f|
                f.write(@photo_data.read)
            end
            @photo_data = nil
            self.save
        end
    end
    
    def set_attributes (attributes)
        attributes.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
    end

end
