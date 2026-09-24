use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

tfl = load-table:
  period :: String,
  reporting-period :: String,
  days :: String,
  period-start :: String,
  period-end :: String,
  bus :: String,
  underground :: String,
  dlr :: String,
  tram :: String,
  overground :: String,
  cable-car :: String,
  tfl-rail :: String
  source: csv-table-url("https://data.london.gov.uk/download/ep8ow/06a805f6-77c6-481a-8b08-ddef56afffdd/tfl-journeys-type.csv", default-options)
end

tfl
table-length(tfl)
get-row(tfl, 0)
get-column(get-row(tfl, 0), "bus")

# Error tests (run these in the interactions window instead):
# get-row(tfl, 500)  -> error: row-n-too-large (the table only has 213 rows)
# get-column(get-row(tfl, 0), "pizza")  -> error: no column named "pizza"


fun is-bus-time-short(a-bus-time :: Row) -> Boolean:

end