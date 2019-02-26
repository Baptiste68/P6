select i.nom_ingredient, quantite_recette, i.quantiteu_ingredient
from ocpizza.recette 
inner join ocpizza.ingredient as i on i.id_ingredient = ocpizza.recette.id_ingredient
inner join ocpizza.pizza on ocpizza.pizza.id_pizza = ocpizza.recette.id_pizza
where nom_pizza='4 Saisons'

select quantite_recette, quantite_stock
from ocpizza.recette as r
inner join ocpizza.stock as s on s.id_ingredient=r.id_ingredient
inner join ocpizza.pizza as p on p.id_pizza=r.id_pizza
where p.nom_pizza='Margarita' and s.id_restaurant='1'