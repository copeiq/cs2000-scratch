use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
import lists as L


# creates list
discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end


# finds the UNIQUE codes from the list
unique-codes = L.distinct(discount-codes)


# filters so basically show only unique ones
real-codes = L.filter(is-real-code, unique-codes)

the-real-real-code = L.filter( lam(x :: String):  # if takes 2 then its x, y
    
    # take function from is-real-code
    not(string-to-lower(x) == "none")
    
  end, 
  unique-codes
)

if real-codes == the-real-real-code:
  true   # the lambda has the same effect as the function without, use lambda functions where you can and only using it once.
else:
  false
end






str-fry = [list: "garlic", "peppers", "pork", "tomato", "onions"]
dosa = [list: "rice", "lentils", "potato", "garlic"]
arroz-con-pollo = [list: "chicken", "garlic", "rice", "tomato"]



#|
fun common-ingredients(l1 :: List, l2 :: List) -> List:
  doc: "finds the common ingredients and returns a list that contains common ingredients shared by str-fry, dosa, and arroz con pollo."
  
  
  ...
  
  
  
where:
  common-ingredients([list: "garlic"], [list: "garlic"]) is [list: "garlic"]
  
end
|#



# problem 5

employees = load-table: NAME, DEPARTMENT_NAME, TITLE, REGULAR, RETRO, OTHER,
  OVERTIME, INJURED, DETAIL, QUINN_EDUCATION, TOTAL_GROSS, POSTAL
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end

employees


fun has-smith(x :: String) -> Boolean:
  doc: "checks if a name has smith"
  
  
  if string-contains(string-to-lower(x), "smith"):
    true
  else:
    false
  end
  
where:
  has-smith("Smith") is true
  has-smith("SMITH") is true
  has-smith("SMiTH") is true
  has-smith("smith") is true
end



names = get-column(employees, "NAME")
names


smithList = L.filter(has-smith, names)
smithList

