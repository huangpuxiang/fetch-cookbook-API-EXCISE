namespace :dev do
  task :fetch_menu => :environment do
    puts "Fetch menu data..."
    response = RestClient.get "http://apis.juhe.cn/cook/query.php",
                              :params => { :key => "88134c920c6da59017f7e4fb978671c9", :menu => "红烧肉"}
    data = JSON.parse(response.body)

    data["result"]["data"].each do |c|
      exiting_menu = Menu.find_by_juhe_id(c["id"])
      if exiting_menu.nil?
        Menu.create!(:juhe_id => c["id"], :title => c["title"],
                    :ingredients => c["ingredients"], :steps => c["steps"])
      end
    end

    puts "Total: #{Menu.count} menus"
  end
end
