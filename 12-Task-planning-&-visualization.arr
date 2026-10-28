use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#|
weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end


#|
   
   
   
   Our task plan, the steps we need to do are:

Normalize the data -- in particular, the temperature column needs to be all numbers! While the precipitation column seems to have problems (a negative number), since our task doesn't have anything to do with precipitation, we don't need to deal with that.
Create a new column with the three different bins -- cold, mild, or hot.
Chart that new column.
   
|#
      

# can be invalid str
fun normalize-temp(v) -> Number:
  doc: "given a number or a string that represents a number, converts to a number"
  if is-string(v): 
    string-to-number-unsafe(v)
  else: 
    v
  end
where:
  normalize-temp(10) is 10
  normalize-temp("13") is 13
end


fixed-weather-data = transform-column(weather-data, "temperature", normalize-temp)

fun bucket-temp(t :: Number) -> String:
  
  doc: "numbers (temp in fahrenheit) < 40 turn into 'cold', >=40 and < 60 to 'mild' and >=60 to 'hot'"
  
  if t < 40:
    "cold"
  else if t < 60:
    "mild"
  else:
    "hot"
  end
  
where:
  bucket-temp(-10) is "cold"
  bucket-temp(0) is "cold"
  bucket-temp(39.9) is "cold"
  bucket-temp(40) is "mild"
  bucket-temp(58) is "mild"
  bucket-temp(60) is "hot"
  bucket-temp(100) is "hot"
end

categorized-durations = build-column(fixed-weather-data, "category", bucket-temp)

|#


#| we might need to add first name, last name, salary, position, company name etc.
   
   
|#


employees =
  table: full-name :: String, department :: String
    row: "Jordan Smith", "Sales"
    row: "Alexandra Lee", "Engineering"
    row: "Sam", "Marketing"
    row: "Ng, Alice", "Operations"
  end

