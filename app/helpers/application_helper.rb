module ApplicationHelper
  def fill_background_color
    color = if user_signed_in? 
              "#ffffff" 
            else 
              "#042852" 
            end
  end
end
