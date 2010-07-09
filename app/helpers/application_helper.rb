# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def add_event_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :links, :partial => 'event_link',
      :object => EventLink.new
    end
  end

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

  def javascript(file)
    content_for(:head) { javascript_include_tag file }
  end

  class CurrentPageDecorator
    def initialize(helper,options)
       @helper = helper
       @html_class = options[:class] || 'active'
    end

    def link_to(*args,&blk)
      name = args.first
      options = args.second || { }
      html_options = args.third || { }
      html_options[:class] = @html_class if @helper.my_current_page?(options)
      @helper.link_to(name,options,html_options,blk)
    end
  end

  def my_current_page?(c)
    controller.controller_name == c[1..-1] or current_page?(c)
  end

  def highlight_current_link(options = { },&blk)
    raise ArgumentError unless block_given?
    yield CurrentPageDecorator.new(self,options)
  end
end
