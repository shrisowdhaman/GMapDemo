module EventPhotosHelper

  def message(event_photo)
    msg = "Title :"<<event_photo.title<<" <br />Description : "<<event_photo.desc    
    return msg
  end
  
end
