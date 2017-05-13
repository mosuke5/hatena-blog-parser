require 'pp'

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

pp result
