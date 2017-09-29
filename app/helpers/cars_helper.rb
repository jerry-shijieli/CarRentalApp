module CarsHelper
  
  def car_fields 
    # fields to be displayed on front-end view
    [:licensePlateNumber, :manufacturer, :status] 
  end
    
  def action 
    action_name == 'advanced_search' ? :post : :get 
  end
  
  def display_car_sorted_column_headers(search) 
    car_fields.each_with_object('') do |field, string| 
      string << content_tag(:th, sort_link(search, field, {}, method: action)) 
    end 
  end
  
  def display_car_search_results(objects) 
    objects.each_with_object('') do |object, string| 
      string << content_tag(:tr, display_car_search_results_row(object)) 
    end 
  end
  
  def display_car_search_results_row(object)
    fieldCount = 0
    car_fields.each_with_object('') do |field, string|
      if fieldCount == 0
        string << content_tag(:td, link_to(object.send(field), '/cars/' + object.id.to_s))
      else
        string << content_tag(:td, object.send(field))
      end
      
      fieldCount += 1
      
    end
    .html_safe
  end
  
end
