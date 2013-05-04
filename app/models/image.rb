class Image < ActiveRecord::Base
  attr_accessible :file, :user_id, :hashed_url
  
  belongs_to :user
  
  # after_create :generate_hashed_id
  
  mount_uploader :file, FileUploader
  
  def to_param
    hashed_url
  end
  
  # def generate_hashed_id
  #   test = self.id + 1009876
  #   self.update_attributes(:hashed_url => test)
  # end
  
end
