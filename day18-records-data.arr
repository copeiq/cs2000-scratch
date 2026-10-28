use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

data XYCoordinate:
  | coordinate(x :: Number, y :: Number)
end


point1 :: XYCoordinate = coordinate(3, -2)

print('Point 1 = (' + num-to-string(point1.x) + ', ' + num-to-string(point1.y) + ')')



#|
fun point-smaller0than(p1 :: XYCoordinate, p2 :: XYCoordinate) -> Boolean:
  
  
where:
  
end
   
|#


data BookRecord:
  | book(title :: String, author :: String, pages :: Number, rating :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387, 4.3)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209, 4.9)
brave-new-world = book("Brave New World", "Aldous Huxley", 268, 3.9)


# u ccan use datatype like bookrecord to reduce redundancy so instead of putting toitle :: String etc u can just use bookrecord

fun is-highly-rated(b :: BookRecord) -> Boolean:
  doc: "returns whether book is highly rated"
  
  if (b.rating > 4):
    true
  else:
    false
  end
where:
  abook = book("v", "x", 300, 3.4)
  bbook = book("v", "x", 300, 4.4)
  is-highly-rated(abook) is false
  is-highly-rated(bbook) is true
end

fun summary-string(b :: BookRecord) -> String:
  doc: "returns summary"
  
  b.title + " is written by " + b.author + ". The book has " + num-to-string(b.pages) + ", with a rating of " + num-to-string-digits(b.rating, 2)
  
end

summary-string(book("v", "x", 300, 3.4))


fun is-long-book(b :: BookRecord) -> Boolean:
  doc: "returns whether book has more than 350"
  b.pages > 350
where:
  cbook = book("x", "y", 360, 3.2)
  dbook = book("xy", "xy", 330, 3.2)
  is-long-book(dbook) is false
  is-long-book(cbook) is true

end

data Podcast:
  | podcast(name :: String, length-seconds :: Number, who-made-it :: String, year-released :: Number)
end

fun summary-pod(p :: Podcast) -> String:
  doc: "returns summary of podcast"
  
  p.name + " is created and filmed by " + p.who-made-it + ". The podcast has a length " + num-to-string(p.length-seconds) + ", and it was released in " + num-to-string(p.year-released)
  
end

summary-pod(
  podcast("how I code", 360, "joe rogan", 2015)
  
)

data Recipe:
  | Recipess(title :: String, servings :: Number, prep-time :: Number)
end

recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end


fun row-to-recipe(r :: Row) -> Recipe:
  
  Recipess(
    get-column(r, "title"),
    get-column(r, "servings"),
    get-column(r, "prep-time")
  
   )
end



recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))

row-to-recipe(get-row(recipes, 0))