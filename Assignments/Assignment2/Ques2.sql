select count(*) as Count from 
(Select film_category.film_id from staff
	join rental
	on staff.staff_id = rental.staff_id
	join inventory
	on inventory.inventory_id = rental.inventory_id
	join film_category
	on film_category.film_id = inventory.film_id
	join category
	on category.category_id = film_category.category_id
	join store
	on store.manager_staff_id = staff.staff_id
	where category.name = "Sci-Fi" and staff.first_name = "Jon" and staff.last_name = "Stephens"
	group by film_category.film_id
) as A