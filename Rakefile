namespace :github do
  desc "Build and deploy to github"
  task :deploy do
    # set up repo
    repo = "git@github.com:seconds/seconds.github.com.git"

    if repo == nil or repo == ""
      puts "ERROR: can't find a valid repo. Use rake REPO=git@github.com:username/repo.git deploy:github to override"
      return
    end

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