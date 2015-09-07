require 'rest-client'

wiki_url = "http://en.wikipedia.org/"
wiki_local_filename = "wiki-page.html"

File.open(wiki_local_filename, "w") do |file|
   file.write(RestClient.get(wiki_url))
end

###

require 'open-uri'         
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
local_fname = "hamlet.txt"
File.open(local_fname, "w"){|file| file.write(open(url).read)}

File.open(local_fname, "r") do |file|
   file.readlines.each_with_index do |line, idx|
      puts line if idx % 42 == 41
   end   
end


###

is_hamlet_speaking = false
File.open("hamlet.txt", "r") do |file|
   file.readlines.each do |line|
    #you can use regex to match particular things you are looking for!
      if is_hamlet_speaking == true && ( line.match(/^  [A-Z]/) || line.strip.empty? )
        is_hamlet_speaking = false
      end

      is_hamlet_speaking = true if line.match("Ham\.")

      puts line if is_hamlet_speaking == true
   end   
end

###

#to close a file simply write your open method as a block...it will close automatically.

DIRNAME = "data-hold"
Dir.glob("#{DIRNAME}/**/*.*").sort_by{|fname| File.size(fname)}.reverse[0..9].each do |fname|
   puts "#{fname}\t#{File.size(fname)}"
end