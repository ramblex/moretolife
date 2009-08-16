# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def date_format(date_begin, date_end)
    time = date_begin.strftime(" %l:%M %p").downcase
    # Don't show the time if it's set to midnight - Assume no events start
    # at midnight unless they are an 'all day' event.
    if time == " 12:00 am"
      time = ""
    end

    # Handle events spanning multiple days
    if date_end > date_begin
      if date_begin.month == date_end.month
        start_day = date_begin.strftime("%A %e")
      else
        start_day = date_begin.strftime("%A %e %B")
      end
      end_day = date_end.strftime("%e %B")
      "#{start_day}-#{end_day}#{time}"
    else
      date = date_begin.strftime("%A %e %B")
      "#{date}#{time}"
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end
end
