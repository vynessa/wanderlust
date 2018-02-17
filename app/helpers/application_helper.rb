module ApplicationHelper
  def fill_background_color
    fill_background = if user_signed_in?
                        color = "#ffffff"
                      else
                        color = "#042852"
                      end
  end
end
