module ReservationsHelper
  
  def reservation_fields 
    # fields to be displayed on front-end view
    [:id, :checkOutTime, :pickUpTime, :expectedReturnTime, :returnTime, :user_id, :car_id, :reservationStatus] 
  end
  
  def field_text(field)
    translation = {:id=>"Index", :checkOutTime=>"Check out time", :pickUpTime=>"Pick up time", 
      :expectedReturnTime=>"Expected return time", :returnTime=>"Return time", 
      :user_id=>"User", :car_id=>"Car", :reservationStatus=>"Status"}
    translation[field]
  end
    
  def action 
    action_name == 'advanced_search' ? :post : :get 
  end
  
  def display_reservation_sorted_column_headers(search) 
    reservation_fields.each_with_object('') do |field, string| 
      string << content_tag(:th, sort_link(search, field_text(field), {}, method: action), class: 'thead-default') 
    end 
  end
  
  def display_reservation_search_results(objects) 
    objects.each_with_object('') do |object, string| 
      string << content_tag(:tr, display_reservation_search_results_row(object)) 
    end 
  end
  
  def display_reservation_search_results_row(object)
    fieldCount = 0
    display = ""
    reservation_fields.each_with_object(display) do |field, string|
      if fieldCount == 0
        string << content_tag(:td, link_to("#"+object.send(field).to_s, '/reservations/' + object.id.to_s))
      elsif field == :user_id
        uid = object.send(field)
        user = User.find_by_id(uid)
        uname = user.name
        string << content_tag(:td, link_to("#{uid} - #{uname}", user) )
      elsif field == :car_id
        cid = object.send(field)
        car = Car.find(cid)
        cplate = car.licensePlateNumber
        string << content_tag(:td, link_to("#{cplate}", car))
      else
        string << content_tag(:td, object.send(field))
      end
      
      fieldCount += 1
      
    end
    display << content_tag(:td, link_to("show", '/reservations/' + object.id.to_s))
    display.html_safe
  end
  
end
