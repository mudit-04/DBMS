Select distinct(customer_list.name) as Customer, customer_list.country as Country from customer_list
join rental
on customer_list.ID = rental.customer_id
join inventory
on inventory.inventory_id = rental.inventory_id
join film_category
on film_category.film_id = inventory.film_id
join category
on category.category_id = film_category.category_id
where category.name = "Sports" and customer_list.country = "India";
