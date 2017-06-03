require 'uri'
require 'open-uri'
require 'set'
require 'json'

SH_URI = 'https://www.dropbox.com/sh/'

def hrefs(url)
  URI.extract(open(url).read)
end

def simplify_sh_url(url)
  url.chomp('?dl=0').chomp('?dl=1')
end

def convert_to_direct_download_link (url)
  url.chomp('?raw=1').sub('www.dropbox.com', 'dl.dropboxusercontent.com')
end

def extract_links(url, seen)
  $stderr.puts "\nFolder: #{url}, seen: #{seen.count}"
  seen << url
  hrefs(url).select do |href|
    href.start_with? SH_URI
  end.map(&method(:simplify_sh_url)).reject do |href|
    seen.include? href
  end.flat_map do |href|
    seen << href
    if href[/.jpe?g/i]
      $stderr.printf '.'
      [href]
    else
      # assume href points to a folder
      extract_links(href, seen)
    end
  end.map(&method(:convert_to_direct_download_link))
end

def links(url)
  extract_links(simplify_sh_url(url), Set.new)
end

def usage
  puts "usage: #{$0} URL"
  puts "Extract all image URLs from a public Dropbox shared URL"
end

def main(args)
  url = args.first
  unless url
    puts "Error: missing URL."
    usage
    exit 64
  end
  if ['-h', '--help'].include? url
    usage
    exit 0
  end

  puts JSON.generate(links(url))
end

main(ARGV) if __FILE__ == $0
