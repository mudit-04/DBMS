select Count(*) as Count from rental
join customer
on customer.customer_id = rental.customer_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film
on film.film_id = inventory.film_id
where film.rating = "R" and customer.first_name = "SUSAN" and customer.last_name = "WILSON";