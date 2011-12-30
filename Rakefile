
task :pull do
  puts `git commit -a -m 'refreshing'`
  puts `git pull origin master`
end


task :push do
  puts `git commit -a -m 'refreshing'`
  puts `git push origin master`
end

task :deploy do
  Rake::Task["pull"].invoke
  Rake::Task["push"].invoke
  Rake::Task["github:deploy"].invoke
end

namespace :github do
  desc "Build and deploy to github"
  task :deploy do
    # set up repo
    repo = "git@github.com:seconds/seconds.github.com.git"

    puts "Building middleman..."
    puts `rm -Rf ./build`
    puts `middleman build`
    puts `cp ./source/CNAME ./build/CNAME`

    puts "Deploying to github (#{repo})..."
    puts `cd ./build && git init`
    puts `cd ./build && git add .`
    puts `cd ./build && git commit -m 'regenerating'`
    puts `cd ./build && git remote add github #{repo}`
    puts `cd ./build && git push github master --force`
  end
end