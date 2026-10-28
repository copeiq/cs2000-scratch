fuse context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun all-short-words(words :: List<String>) -> Boolean block:
 
  doc: "returns true if every word in a list has 4 or fewer characters"
  
  # variable/boolean
  var all-short = true
  
  # loops through the list
  for each(w from words):
    
    # checks if they are all short and the length of each string (elements in the list) has a length 4 or fewer
    all-short := all-short and (string-length(w) <= 4)
    
  end
  
  all-short
  
where:
  
  all-short-words([list: "a", "four"]) is true
  all-short-words([list: "cat", "horse"]) is false
end


fun reverse-list(words :: List<String>) -> List<String> block:
  
  doc: "returns a reversed list"
  
  var newList = [list: ]
  
  for each(w from words):
    
    # links put all words to front so reverse
    newList := link(w, newList) 
    
  end
  
  newList
  
where:
  
  reverse-list([list: "cat", "horse"]) is [list: "horse", "cat"]
  reverse-list([list: "cat", "horse", "a", "b"]) is [list: "b", "a", "horse", "cat"]
end



fun concat-all(words :: List<String>) -> String block:
  doc: "puts all the strings in the list into 1 string"
  
  # new var
  var newStr = ""
  
  # for loop, loops through every element in words list
  for each(w from words):
    
    # combines all the strings of the elements together
    newStr := newStr + w
    
  end
  
  newStr
  
where:
  concat-all([list: "cat", "horse"]) is "cathorse"
end