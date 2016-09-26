module AdminlteHelper

  def admin_sidebar_active
    if params[:controller] == "tips"
      return 0
    elsif params[:controller] == "admin_users"
      return 1
    elsif params[:controller] == "pricings"
      return 2
    end
  end

  def admin_sidebar_active_to_class(value1, value2)
    if value1 == value2
      return "active"
    end
  end

  def box_header_class(value = 0)
    get_color_class(value)
  end

  def get_color_class(value = 0)
    array = ["",
            "box-primary",
            "box-info",
            "box-success",
            "box-warning",
            "box-danger"]
    return array[value]
  end

  def skin_class(value = 0)
    array = ["skin-blue",
            "skin-black",
            "skin-purple",
            "skin-green",
            "skin-red",
            "skin-yellow",
            "skin-blue-light",
            "skin-black-light",
            "skin-purple-light",
            "skin-green-light",
            "skin-red-light",
            "skin-yellow-light"]
    return array[value]
  end

end
