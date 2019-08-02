Select count(*) as count from film
join film_category
on film.film_id = film_category.film_id
join category
on category.category_id = film_category.category_id
where category.name = "Documentary" and film.special_features like "%Deleted Scenes%";