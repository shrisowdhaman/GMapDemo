module ApplicationHelper

  def getTime
    "Time : #{Time.now.strftime("%Y-%m-%d")}"
  end  
  
end
