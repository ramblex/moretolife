atom_feed do |feed|
  feed.title("More to Life events")
  feed.updated(@events.first.created_at)

  @events.each do |event|
    feed.entry(event) do |entry|
      entry.title(event.name)
      entry.date(date_format(event.date_begin, event.date_end))
      entry.content(event.short_desc, :type => 'html')
    end
  end
end
