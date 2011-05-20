task :build do
  sh "rm -fr build"
  sh "mkdir build"
  sh "haml --format html5 --double-quote-attributes views/index.haml build/index.html"
  sh "sass --scss views/screen.scss build/screen.css"
  sh "cp -r public/* build/"
end

task :deploy => :build do
  sh 'rsync --checksum -rtzh --progress --delete build/ sun:/var/www/appstoreorapplestore.com/'
  sh 'say -v zarvox "deploy is now complete."'
end
