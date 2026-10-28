use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
end

# Step 1: Define a function to calculate value of column for 1 row

# define a function to calculate value of column (distance) for 1 row.

fun calculate-distance(an-item :: Row) -> Number:
  
  doc: "Calculates the distance between 2 coordinates by using the pythagerem theorem."
  
  num-sqrt(    
    num-expt(get-column(an-item, "x-coordinate"), 2) + 
    num-expt(get-column(an-item, "y-coordinate"), 2) 
  )
where:
  calculate-distance(get-row(items, 0)) is-roughly num-sqrt(num-expt(23, 2) + num-expt(-87, 2))
  calculate-distance(get-row(items, 1)) is-roughly num-sqrt(num-expt(-45, 2) + num-expt(12, 2))
  calculate-distance(get-row(items, 2)) is-roughly num-sqrt(num-expt(78, 2) + num-expt(-56, 2))
  calculate-distance(get-row(items, 3)) is-roughly num-sqrt(num-expt(-9, 2) + num-expt(64, 2))
  calculate-distance(get-row(items, 4)) is-roughly num-sqrt(num-expt(51, 2) + num-expt(-33, 2))
  calculate-distance(get-row(items, 5)) is-roughly num-sqrt(num-expt(-66, 2) + num-expt(5, 2))
  calculate-distance(get-row(items, 6)) is-roughly num-sqrt(num-expt(38, 2) + num-expt(-92, 2))
  calculate-distance(get-row(items, 7)) is-roughly num-sqrt(num-expt(-17, 2) + num-expt(49, 2))
end


# Step 2: Call to build - column

item-with-distance = build-column(items, "distance", calculate-distance)
# column name     # the value sinside the column


# TODO: Update values in a column: update coordinates to be closer by 1 unit

# step 1: define to map the current value to the updated value


fun moves-item-closer(current-val :: Number) -> Number:
  
  doc: "moves item closer by 1 unit"
  
  current-val - 1
  
  where:
  
  moves-item-closer(51) is 50
  moves-item-closer(69421) is 69420
  
end




table1 = transform-column(items, "x-coordinate", moves-item-closer)
table2 = transform-column(items, "y-coordinate", moves-item-closer)

table3 = transform-column(transform-column(items, "x-coordinate", moves-item-closer), "y-coordinate", moves-item-closer)

# blah 


fun scale-coordinate(current-val :: Number) -> Number:
  doc: "Scales a coordinate down by 10%."
  current-val * 0.9
where:
  scale-coordinate(23) is 20.7
  scale-coordinate(-87) is -78.3
  scale-coordinate(50) is 45
end

new-items =
  transform-column(
    transform-column(items, "x-coordinate", scale-coordinate),
    "y-coordinate",
    scale-coordinate)

new-items


fun closest-to-player(items :: Table) -> String:

  order-by(table, column-name, function)
where:
  
end

  
  order-by(table, column-name, function)
  
end
