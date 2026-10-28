use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun has-positive(lst :: List<Number>) -> Boolean block:
  
  doc: "returns true if one element in the list is positive"
  
  var res = false
  
  for each(v from lst):
    
    when (v < 0):
      
      res :=true
      
    end
    
  end
  
  res
  
where:
  
  has-positive([list: 3, 4, -3]) is true
  has-positive([list: 3, 4, 4]) is false
  
end


data Vehicle:
    # no fields
  | bike 
    # has fields
  | car(make :: String, year :: Number)
    # has fields
  | truck(make :: String, year :: Number, capacity :: Number)
end

# uses the fields from datatype Vehicles

fun vehicle-age(v :: Vehicle, current_year :: Number) -> Number:
  doc: "how old is the vehicle"
  cases (Vehicle) v:
    | bike => 0
    | car(make, year) => current_year - year
    | truck(make, year, capacity) => current_year - year
  end
  
where:
  vehicle-age(car("toyota", 2022), 2026) is 4
  vehicle-age(bike, 2026) is 0
  vehicle-age(truck("volks", 2021, 5000), 2030) is 9
  
end

data Grade:
  | letter(Grade :: String)
  | percent(To100 :: Number)
  | pass-fail(isPass :: Boolean)
end


fun grade-to-gpa(g :: Grade) -> Number:
  doc: "converts any grade to 4.0 gpa scale"
  cases (Grade) g:
    | letter(Grade) => 
      
      ask:
        | Grade == "A" then: 4.0
        | Grade == "B" then: 3.0
        | Grade == "C" then: 2.0
        | Grade == "D" then: 1.0
        | Grade == "F" then: 0.0
      end
    | percent(To100) => 
      
    | pass-fail(isPass) => 
      if isPass:  
  end
  
  
end

