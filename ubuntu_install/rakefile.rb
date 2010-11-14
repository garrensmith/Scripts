
task :default => [:entertainment, :web, :vim, :github, :dev_ruby,:dev_node , :npm ]

task :vim do
    #sh "sudo apt-get install vim-gnome"
end

task :dev_ruby do 
    puts "Install dev tools"
    #sh "sudo gem install rspec rails sinatra albacore ronn pony datamapper cucumber capybara bundler jekyll"
    
end

task :dev_node do 
    puts "Install dev tools"
    sh "sudo chown -R $USER /usr/local"    
sh "git clone git://github.com/ry/node.git ~/dev/node"
    sh "~/dev/node/configure"
    sh "~dev/node/make"
end

task :npm do 
    sh "curl http://npmjs.org/install.sh | sh"
    sh "npm install express expresso"
end 

task :github do 
    puts "cloning src"
    sh "git clone git@github.com:garrensmith/Jody.git ~/dev/Jody"
    sh "git clone git@github.com:garrensmith/BuildMachine.git ~/dev/BuildMachine"
end

task :entertainment do 
    puts "Install entertainment programs"
    sh "sudo apt-get install gimp inkscape banshee banshee-extension-lyrics banshee-extension-awn docky"
end

task :web do 
    puts "Install web programs"
    sh "sudo apt-get install chromium-browser"
end
