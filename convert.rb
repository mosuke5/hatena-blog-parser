require 'pp'
require 'cgi'
require 'time'
require 'sanitize'
require 'nokogiri'
require 'fileutils'

def make_filename(basename)
  basename.split('/').last
end

def make_dirpath(basename)
  basename.split('/')[0..2].join('/')
end

# Parse Hatena blog export file
result = []
File.open(ARGV[0], "r") do |f| 
  entries = f.read.split("\n--------\n")
  entries.each do |entry|
    entry_hash = {}
    entry_string = entry.split("\n-----\n")
    meta_string = entry_string[0]
    body_string = entry_string[1]

    entry_hash["CATEGORY"] = Array.new
    meta_string.split("\n").each do |m|
      tmp = m.split(":\s")

      if tmp.first == "CATEGORY"
        entry_hash[tmp.first].push(tmp[1])
      else
        entry_hash[tmp.first] = tmp[1]
      end
    end
    entry_hash["BODY"] = body_string
      .gsub(/BODY:\n/, "")
      .gsub(/\n-----$/, "")
    result.push(entry_hash)
  end
end

# Convert to Hugo format
result.each do |r|
  if r['STATUS'] == 'Draft'
    next
  end
  filename = make_filename(r["BASENAME"])
  dirpath = make_dirpath(r["BASENAME"])
  FileUtils.mkdir_p("./data/#{dirpath}/")
  File.open("./data/#{dirpath}/#{filename}.md", "w") do |f|
    date = DateTime
      .strptime("#{r['DATE']} JST", '%m/%d/%Y %H:%M:%s %Z')
      .strftime('%Y-%m-%dT%H:%M:%S+09:00')
    archive_year = DateTime.strptime("#{r['DATE']} JST", '%m/%d/%Y %H:%M:%s %Z').year
    description = Sanitize.clean(r['BODY']).gsub(/(\r\n|\r|\n|\f)/,"").slice(0, 120).gsub("\"", "\\\"")

    doc = Nokogiri::HTML.parse(r['BODY'])
    doc.search('pre').each do |d|
      d.content = CGI.unescapeHTML(Sanitize.clean(d))
    end
    content = <<EOS
+++
Categories = ["tech"]
Description = "#{description}"
Tags = #{r['CATEGORY']}
date = "#{date}"
title = "#{r['TITLE']}"
author = "#{r['AUTHOR']}"
archive = ["#{archive_year}"]
draft = false
+++

#{doc.search('body').to_html}
EOS

    f.puts content
  end
end
