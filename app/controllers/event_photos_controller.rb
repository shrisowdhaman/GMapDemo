class EventPhotosController < ApplicationController

  def index
    @event = Event.find(params[:event_id])   
  end

  def create
    
   @event = Event.find(params[:event_id])
   @event_photo = @event.event_photos.build(params[:event_photo])

    respond_to do |format|
      if @event_photo.save
        format.html { redirect_to( event_event_photos_path(@event)) }
        format.xml  { render :xml => @event_photo, :status => :created, :location => @event_photo }
      else
        format.html { redirect_to  event_event_photos_path(@event), notice: "Valildation Error" }
        format.xml  { render :xml => @event_photo.errors, :status => :unprocessable_entity }
      end
    end

  end

end
