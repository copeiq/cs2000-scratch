use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun iswintercoming(month :: String) -> Boolean:
  
  doc: "takes a parameter month, which you need to input a string of a months name to determine whether to is winter, whether it is not winter is coming or it is winter. If the months are  december to feb then winter is here, if october and november then we'll say winter is coming etc"
  
  
  #|

  if (month == "October") or (month == "November"):
    'Winter is coming'
  else if (month == "December") or (month == "Janurary") or (month == "Feburary"):
      'It is winter'
  else:
    'Winter is not coming'
  end
  |#
  
  if (month == "October") or (month == "November"):
    
    # returns true because we did -> Boolean
    true
    
  else if (month == "December") or (month == "Janurary") or (month == "Feburary"):
    true
    
    # else returns false
  else:
    false
  end
  
  
  # basically EXPECTED
where:
  iswintercoming("October") is true
  
  # basically we EXPECTED with november or month wtv/input to be true.
  iswintercoming("November") is true
  iswintercoming("July") is false
  iswintercoming("") is false
end

iswintercoming("October")
iswintercoming("December")






fun choose-hat(temp-in-F :: Number) -> String:
  doc: "determines appropriate head gear, with above 80F a sun hat, below nothing"
  spy:
    temp-in-F,
    comparison: temp-in-F > 80
  end
  if temp-in-F > 80:
    "sun hat"
  else if (temp-in-F >= 50) and (temp-in-F <= 80):
    "no hat"
  else:
    "white hat"
  end
where:
  choose-hat(50) is "no hat"
  choose-hat(85) is "sun hat"
  choose-hat(80) is "sun hat"
  choose-hat(40) is "white hat"
end



fun add-glasses(temp :: Number) -> String:
  doc: "adds a hat to glasses"
  v = choose-hat(temp) + " and" + " glasses"
  v
end
add-glasses(50)


fun choose-hat-or-visor(temp-in-F :: Number, has-visor :: Boolean) -> String:
  doc: "determines appropriate head gear, with above 95F a Visor, below then it calls choose-hat function"
  spy:
    temp-in-F,
    comparison: temp-in-F > 80
  end
  if (temp-in-F > 95) and (has-visor):
     "Visor"
  else:
    choose-hat(temp-in-F)
  end
where:
  choose-hat(50, true) is "no hat"
  choose-hat(85, true) is "sun hat"
  choose-hat(80, true) is "sun hat"
end