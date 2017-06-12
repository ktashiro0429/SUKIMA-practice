class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/admin_images/#{file_name}", 'wb') { |f|
        f.write(file.read)
      }
      self.image = file_name
    end
  end
end
