module UserAttributesHelper

  def show_address(user_attribute)
    address = user_attribute.street<<" , "<<user_attribute.city
    return address
  end
end
