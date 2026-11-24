(
    SELECT
        u.name AS results
    FROM MovieRating AS m
    LEFT JOIN Users AS u
        ON m.user_id = u.user_id
    GROUP BY m.user_id, u.user_id
    ORDER BY COUNT(*) DESC, u.name ASC 
    LIMIT 1
)

UNION ALL

(
    SELECT
        m.title AS results
    FROM MovieRating AS r
    JOIN Movies AS m
        ON r.movie_id = m.movie_id
        WHERE DATE_FORMAT(r.created_at, '%Y-%m') = '2020-02'
    GROUP BY r.movie_id, m.title
    ORDER BY AVG(r.rating) DESC, m.title ASC
    LIMIT 1
);