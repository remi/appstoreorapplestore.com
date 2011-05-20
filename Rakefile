task :build do
  system("rm -fr build")
  system("mkdir build")
  system("haml --format html5 --double-quote-attributes views/index.haml build/index.html")
  system("sass --scss views/screen.scss build/screen.css")
  system("cp -r public/* build/")
end

task :deploy => :build do
  sh 'rsync --checksum -rtzh --progress --delete build/ sun:/var/www/appstoreorapplestore.com/'
  sh 'say -v zarvox "deploy is now complete."'
end
