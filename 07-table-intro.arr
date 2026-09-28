use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


include csv

recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))

recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))

# exploring
table-length(recipes)
get-row(recipes, 0)
get-column(get-row(recipes, 0), "title")
mean(recipes, "prep-time")
sum(recipes, "servings")

fun is-prep-time-short(a-recipe :: Row) -> Boolean:
  
  doc: "returns true or false by comparing recipe prep time against 20 min, so if less returns true"
  
  
  get-column(a-recipe, "prep-time") < 20
 
  #|
  if (get-column(a-recipe, "prep-time")) < 20:
      true
  else:
    false
  end
  |#
  
where:
  is-prep-time-short(get-row(recipes, 0)) is true
  is-prep-time-short(get-row(recipes, 1)) is false
  is-prep-time-short(get-row(recipes, 5)) is false
end


orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end


high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(r :: Row) -> Boolean:
  doc: "returns whether the amount column is >= 5"
  get-column(r, "amount") >= 5.0
where:
  is-high-value(get-row(orders, 2)) is true
  is-high-value(get-row(orders, 3)) is false
end



fun is-morning(r :: Row) -> Boolean:
  doc: "checks if the time in a row represents a morning."
  
  # 0 is the default value when the particular string CANNOT be convert to a number, thats why ideally you use 0.
  # v = transform-column(r, "time", string-to-number-default(0))
  
  
  
  get-column(r, "time") < "12:00"
  
where:
  is-morning(get-row(orders, 3)) is true
end
  
