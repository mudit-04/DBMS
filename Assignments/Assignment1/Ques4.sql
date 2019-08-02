Select distinct(customer_list.name) as Customer, customer_list.country as Country from customer_list
join rental
on customer_list.ID = rental.customer_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film_actor
on film_actor.film_id = inventory.film_id
join actor
on actor.actor_id = film_actor.actor_id
where actor.first_name = "NICK" and actor.last_name = "WAHLBERG" and customer_list.country = "Canada";
