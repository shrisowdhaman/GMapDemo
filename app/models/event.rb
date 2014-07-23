class Event < ActiveRecord::Base
   attr_accessible :title,:content

   belongs_to :user
   has_many :event_photos
   
   validates :title,:content, :presence =>true
end
