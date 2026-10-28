use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

tax-rate = 8.5

fun calc-subtotal(orders :: Table) -> Table:
  doc: "creates a table with additional column for subtotal"
  orders.build-column("subtotal",
    lam(r :: Row) -> Number:
      r["quantity"] * r["unit-price"]
    end)
where:
  test-input = table: quantity :: Number, unit-price :: Number
    row: 1, 10
    row: 3, 5.50
    row: 2, 7.30
  end

  expected = table: quantity :: Number, unit-price :: Number, subtotal :: Number
    row: 1, 10, 1 * 10
    row: 3, 5.50, 3 * 5.50
    row: 2, 7.30, 2 * 7.30
  end

  calc-subtotal(test-input) is expected
end