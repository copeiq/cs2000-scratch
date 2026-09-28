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



fun is-preptime(a-recipe :: Row) -> Boolean:
  doc: "sdfsd"

  # takes column named prep-time and goes through all vals
  if get-column(a-recipe, "prep-time") < 20:
    true
  else:
     false
  end
where:
   is-preptime(get-row(recopes, 0)) is true
   is-preptime(get-row(recopes, 1)) is false
   is-preptime(get-row(recopes, 5)) is false

end


