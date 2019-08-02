select film.title as Name, category.name as Genre, film.rating as Rating from film 
join film_category
on film.film_id = film_category.film_id
join category
on film_category.category_id = film_category.category_id
where category.name = "Comedy" AND film.rating = "PG-13";
