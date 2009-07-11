module EventsHelper
  def add_event_link(name)
    link_to_function "Add event link" do |page|
      page.insert_html :bottom, :links, :partial => 'event_link',
      :object => EventLink.new
    end
  end
end
