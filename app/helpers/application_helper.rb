module ApplicationHelper

  def sidebar_active
    if params[:action] == "players"
      return 0
    elsif params[:action] == "rankings"
      return 1
    elsif params[:action] == "calendar"
      return 2
    elsif params[:action] == "photo_gallery" && !params.has_key?(:level)
      return 3
    elsif params[:action] == "photo_gallery" && params.has_key?(:level)
      return 4
    elsif params[:action] == "posts"
      return 5
    end
  end

  def sidebar_active_to_class(value1, value2)
    if value1 == value2
      return "side_nav_active"
    end
  end

  def sidebar_sub_active_to_class(value1, value2)
    if value1 == value2
      return "side_nav_sub_active"
    end
  end

end
