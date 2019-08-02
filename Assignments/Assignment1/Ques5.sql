select Count(film.title) as count from film
join film_actor 
on film.film_id = film_actor.film_id
join actor
on film_actor.actor_id = actor.actor_id
where actor.first_name = "SEAN" and actor.last_name = "WILLIAMS";