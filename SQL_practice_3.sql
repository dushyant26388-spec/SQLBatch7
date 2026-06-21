-- Q6 (RANK)
SELECT student_name,
       course,
       fee_paid,
       RANK() OVER
       (
          PARTITION BY course
          ORDER BY fee_paid DESC
       ) AS fee_rank
FROM students
ORDER BY course, fee_rank;

-- Q7 (Running Total)
SELECT s.student_name,
       e.subject,
       e.exam_date,
       e.score,
       SUM(e.score) OVER
       (
          PARTITION BY e.student_id
          ORDER BY e.exam_date
       ) AS running_total
FROM students s
JOIN exams e
ON s.student_id = e.student_id
ORDER BY s.student_name,
         e.exam_date;

-- Q8 (LAG & LEAD)
SELECT s.student_name,
       p.placed_date,
       p.package_lpa,
       LAG(package_lpa)
       OVER(ORDER BY placed_date) AS prev_package,
       LEAD(package_lpa)
       OVER(ORDER BY placed_date) AS next_package
FROM placements p
JOIN students s
ON p.student_id = s.student_id
ORDER BY placed_date;


-- Q9 (Students Not Placed)
SELECT s.student_name,
       s.course,
       s.fee_paid
FROM students s
LEFT JOIN placements p
ON s.student_id = p.student_id
WHERE p.student_id IS NULL
ORDER BY s.course,
         s.student_name;


-- Q10 (Top Scorer in Each Subject)
SELECT subject,
       student_name,
       score
FROM
(
    SELECT e.subject,
           s.student_name,
           e.score,
           RANK() OVER
           (
              PARTITION BY e.subject
              ORDER BY e.score DESC
           ) rnk
    FROM exams e
    JOIN students s
    ON e.student_id = s.student_id
)
t
WHERE rnk = 1
ORDER BY subject;