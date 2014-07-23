class UserAttribute < ActiveRecord::Base
  attr_accessible :street, :city, :state, :country,:photo
 
  belongs_to :user

  acts_as_gmappable :check_process => false

  validates :street,:city,:state,:country ,:presence =>true, :length => { :minimum => 2 }
  validates_attachment_content_type :photo, :content_type => 'image/jpeg'

  # Paperclip
  has_attached_file :photo,
   :styles => {
       :thumb=> "100x100#",
       :small  => "150x150>",
       :medium => "300x300>",
       :large =>   "400x400>" }

  # Google Map
  def gmaps4rails_address
    "#{self.street}, #{self.city}, #{self.state}, #{self.country}"
  end

  def gmaps4rails_infowindow
    "Name : #{self.user.login} " << "Addrress: #{self.address(self.user.user_attribute)}"
  end

  def address(user_attribute)
    address = user_attribute.street<<" , "<<user_attribute.city
    return address
  end
end
