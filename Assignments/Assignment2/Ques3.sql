select Sum(payment.amount) as TotalSales from payment
join rental
on payment.rental_id = rental.rental_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film_category
on film_category.film_id = inventory.film_id
join category
on category.category_id = film_category.category_id
where category.name = "Animation";

