module ApplicationHelper
  def page_title(title)
    base_title = 'I’ll buy that!' 
    title.empty? ? base_title : title + " | " +  base_title
  end
end
