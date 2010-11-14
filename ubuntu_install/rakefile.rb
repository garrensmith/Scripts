require "rubygems"
task :default => [:vim, :dev_ruby,:dev_node, :github, :entertainment, :web]

task :vim do
    sh "sudo apt-get install vim-gnome"
end

task :dev_ruby do 
    puts "Install dev tools"
    sh "gem install rspec rails sinatra albacore ronn pony datamapper cucumber capybara bundler jekyll"
    
end

task :dev_node do 
    puts "Install dev tools"
end

task :github do 
    puts "cloning src"
end

task :entertainment do 
    puts "Install entertainment programs"
    sh "sudo apt-get install gimp inkscape banshee banshee-extension-lyrics banshee-extension banshee-extension-awn docky"
end

task :web do 
    puts "Install web programs"
    sh "sudo apt-get install chromium-browser"
end
