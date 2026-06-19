-- Q1
SELECT course,
       COUNT(*) AS student_count,
       SUM(fee_paid) AS total_fee,
       AVG(fee_paid) AS avg_fee
FROM students
GROUP BY course
HAVING AVG(fee_paid) > 90000
ORDER BY avg_fee DESC;


-- Q2
SELECT s.student_name,
       s.course,
       a.student_name AS advisor_name
FROM students s
LEFT JOIN students a
ON s.advisor_id = a.student_id
ORDER BY s.student_id;


-- Q3
SELECT s.student_name,
       s.course,
       COUNT(e.exam_id) AS exams_taken,
       ROUND(AVG(e.score),2) AS avg_score
FROM students s
LEFT JOIN exams e
ON s.student_id = e.student_id
GROUP BY s.student_id,
         s.student_name,
         s.course
ORDER BY s.student_id;


-- Q4
SELECT DISTINCT s.student_name,
       s.course
FROM students s
JOIN exams e
ON s.student_id = e.student_id
WHERE e.score > 90
ORDER BY s.student_name;


-- Q5
SELECT student_name,
       course,
       fee_paid,
       ROUND(course_avg,2) AS course_avg_fee
FROM
(
    SELECT s.*,
           AVG(fee_paid) OVER(PARTITION BY course) AS course_avg
    FROM students s
)
t
WHERE fee_paid > course_avg
ORDER BY course, fee_paid DESC;
