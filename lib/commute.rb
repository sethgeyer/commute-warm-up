require 'csv'

hash_of_commutes = {}


csv = CSV.read("../data/gschool_commute_data.csv")

header_names = csv.shift

unique_names = csv.collect { |array| array[0]}.uniq


unique_names.each do |name|
  hash_of_commutes[name]  = []
end

hash_of_hashes = hash_of_commutes.each_pair do |person, empty_array|
  commutes_by_student = csv.each do |commute|
    empty_hash = {}
    if commute[0] == person
      empty_hash["Week"] = commute[1]
      empty_hash["Day"] = commute[2]
      empty_hash["Mode"] = commute[3]
      empty_hash["Inbound"] = commute[4]
      empty_hash["Outbound"] = commute[5]
      empty_hash["Distance"] = commute[6]
      empty_array << empty_hash
    end
  end
end


  nates_wed = hash_of_hashes["Nate"].select do |each|
    each["Week"] == "4"  && each["Day"] == "Wednesday"
  end

  p nates_wed[0]["Inbound"]



#110
#
# The following questions are what the transportation department would like have answers for:
# * For Week 4 on Wednesday, what was Nate's inbound commute time?
# * For all 5 weeks, what was the group average commute time?
#
# **Extra Credit**
# * Who walked the fastest to gSchool during the 5 weeks? What was their average speed?


# drives = {}
#
# CSV.foreach(%27gschool_commute_data.csv%27, :headers => true, :header_converters => :symbol, :converters => :all) do |row|
# drives[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
# puts drives.inspect
# end



# drives = []
#
# CSV.foreach(%27gschool_commute_data.csv%27, :headers => true, :converters => :all) do |row|
#   drives << row[0] = Hash[row]
#
# end

# puts drives