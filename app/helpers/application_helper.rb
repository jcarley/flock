module ApplicationHelper

  def page_heading
    Date.today.to_formatted_s(:long)
  end

  def active_tab(name)
    active_class = " class='active'"

    return active_class if request.env["REQUEST_PATH"] == "/" && name == "timecards"
    return active_class if controller.controller_name == name
    ""

  end
end
