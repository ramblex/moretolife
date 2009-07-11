# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def date_format(date_begin, date_end)
    time = date_begin.strftime("%l:%M %p").downcase
    date = date_begin.strftime("%A %e %B")
    # Make the assumption that no events start at midnight
    if time.eql?("12:00 am")
        date
    else
      "#{date}, #{time}"
    end
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
end
