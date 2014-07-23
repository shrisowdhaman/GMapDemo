class EventPhoto < ActiveRecord::Base
  attr_accessible :title, :desc,:photo

  belongs_to :event

  validates :title,:desc, :presence=>true
  validates_attachment_content_type :photo, :content_type => 'image/jpeg'
  # Paperclip
  has_attached_file :photo,
   :styles => {
       :thumb=> "100x100#",
       :small  => "150x150>",
       :medium => "300x300>",
       :large =>   "400x400>" }

end
