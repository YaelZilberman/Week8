use sakila;
SELECT a1.actor_id AS actor1_id, a1.first_name AS actor1_first_name, a1.last_name AS actor1_last_name,
       a2.actor_id AS actor2_id, a2.first_name AS actor2_first_name, a2.last_name AS actor2_last_name
FROM actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a1.actor_id < a2.actor_id
ORDER BY a1.actor_id, a2.actor_id; -- List each pair of actors that have worked together.
SELECT f.film_id, f.title, a.actor_id, a.first_name, a.last_name, MAX(actor_film_count) AS film_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN (
    SELECT actor_id, COUNT(*) AS actor_film_count
    FROM film_actor
    GROUP BY actor_id
) AS counts ON fa.actor_id = counts.actor_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id, f.title, a.actor_id, a.first_name, a.last_name
ORDER BY f.film_id; -- For each film, list actor that has acted in more films.
