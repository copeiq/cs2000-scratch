use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import math as M
import statistics as S
include csv



ratings = [list: 3, 4, 5.5, 6, 7, 8]
"A list of ratings: " 
ratings

M.max(ratings)


quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end


quiz1 = get-column(quiz-scores, "quiz1")
quiz2 = get-column(quiz-scores, "quiz2")
quiz3 = get-column(quiz-scores, "quiz3")


"Quiz 1 average: "
S.mean(quiz1)

"Quiz 2 average: "
S.mean(quiz2)

"Quiz 3 average: "
S.mean(quiz3)


random-list = [list: 12, 8, 15, 22, 5, 18]

x = M.min(random-list)
y = M.max(random-list)

x
y

Range = y - x


Range


earnings = load-table: NAME,DEPARTMENT_NAME,TITLE,REGULAR,RETRO,OTHER,OVERTIME,INJURED,DETAIL,QUINN_EDUCATION,TOTAL-ROSS,POSTAL
  
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end

earnings
  