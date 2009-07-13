namespace :sitemap do
  desc "Create Index"
  task(:create_index => :environment) do 
    puts "Creating Index"
    events = Sitemap.new("http://www.moretolife08.org.uk/events_sitemap.xml.gz")
    areas = Sitemap.new("http://www.moretolife08.org.uk/areas_sitemap.xml.gz")
    pages = Sitemap.new("http://www.moretolife08.org.uk/pages_sitemap.xml.gz")
    index = SitemapIndex.new
    
    index.add_sitemap(events)
    index.add_sitemap(areas)
    index.add_sitemap(pages)

    FileUtils.rm(File.join(RAILS_ROOT, "public/sitemap_index.xml.gz"), :force => true)
    
    f =File.new(File.join(RAILS_ROOT, "public/sitemap_index.xml"), 'w')

    f.write index.to_xml
    f.close

    system("gzip #{File.join(RAILS_ROOT, 'public/sitemap_index.xml')}")

  end
  
  desc "Create all sitemaps"
  task(:generate => :environment) do 
    #first create the sitemap for 
    Rake::Task["sitemap:events"].invoke
    Rake::Task["sitemap:areas"].invoke
    Rake::Task["sitemap:pages"].invoke
    Rake::Task["sitemap:create_index"].invoke
  end

  desc "Create Events Sitemap"
  task(:events => :environment) do
    #blog sitemap
    sitemap = Sitemap.new
    sitemap.add_url("http://www.moretolife08.org.uk/events")
    #add every event
    for e in Event.find(:all, :select => "id")
      sitemap.add_url("http://www.moretolife08.org.uk/events/#{e.id}")
    end

    #delete the file
    FileUtils.rm(File.join(RAILS_ROOT, "public/events_sitemap.xml.gz"), :force => true)
    
    f =File.new(File.join(RAILS_ROOT, "public/events_sitemap.xml"), 'w')

    f.write sitemap.to_xml
    f.close

    system("gzip #{File.join(RAILS_ROOT, 'public/events_sitemap.xml')}")

  end

  desc "Create Areas Sitemap"
  task(:areas => :environment) do
    # Areas sitemap
    sitemap = Sitemap.new

    Area.all.each do |a|
      sitemap.add_url("http://moretolife08.org.uk/areas/#{a.id}")
    end

    #delete the file
    FileUtils.rm(File.join(RAILS_ROOT, "public/areas_sitemap.xml.gz"), :force => true)
    
    f =File.new(File.join(RAILS_ROOT, "public/areas_sitemap.xml"), 'w')

    f.write sitemap.to_xml
    f.close

    system("gzip #{File.join(RAILS_ROOT, 'public/areas_sitemap.xml')}")

  end

  desc "Create Pages Sitemap"
  task(:pages => :environment) do
    # pages sitemap
    sitemap = Sitemap.new

    Page.all.each do |p|
      sitemap.add_url("http://moretolife08.org.uk/#{p.permalink}")
    end

    #delete the file
    FileUtils.rm(File.join(RAILS_ROOT, "public/pages_sitemap.xml.gz"), :force => true)
    
    f = File.new(File.join(RAILS_ROOT, "public/pages_sitemap.xml"), 'w')
    f.write sitemap.to_xml
    f.close

    system("gzip #{File.join(RAILS_ROOT, 'public/pages_sitemap.xml')}")
  end

  def set_host_name
    include ActionController::UrlWriter
    default_url_options[:host] = "www.moretolife08.org.uk"
  end
end
