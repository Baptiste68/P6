-- Recette pizza 4 saisons
select i.nom_ingredient, quantite_recette, i.quantiteu_ingredient
from ocpizza.recette 
inner join ocpizza.ingredient as i on i.id_ingredient = ocpizza.recette.id_ingredient
inner join ocpizza.pizza on ocpizza.pizza.id_pizza = ocpizza.recette.id_pizza
where nom_pizza='4 Saisons'

-- Pizzaiolo de Pizzeria Madona
select nom_employee, prenom_employee, type_employee
from ocpizza.employe as employe
inner join ocpizza.restaurant as restaurant on restaurant.id_restaurant = employe.id_restaurant
where type_employee = 'Pizzaiolo' and restaurant.nom_restaurant='Pizzeria Madona'


-- Pizza non faisable
select p.nom_pizza, i.id_ingredient
from ocpizza.pizza as p inner join ocpizza.recette as r on p.id_pizza = r.id_pizza,
(select s.id_ingredient 
from ocpizza.stock as s inner join ocpizza.ingredient as ing on s.id_ingredient = ing.id_ingredient
where s.id_restaurant = '1' and cast (s.quantite_stock as decimal) <= cast (ing.seuil_ingredient as decimal)) as i
where r.id_ingredient = i.id_ingredient