module ApplicationHelper

  def page_heading
    Date.today.to_formatted_s(:long)
  end

end
