

CREATE TABLE ocpizza.Adresse (
                id_adresse SERIAL PRIMARY KEY,
                rue VARCHAR(250) NOT NULL,
                ville VARCHAR(250) NOT NULL,
                code_postal VARCHAR(8) NOT NULL
);


CREATE TABLE ocpizza.Compte (
                id_compte SERIAL PRIMARY KEY,
                email VARCHAR(250) NOT NULL,
                mdp VARCHAR(250) NOT NULL
);


CREATE TABLE ocpizza.Client (
                id_client SERIAL PRIMARY KEY,
                nom_client VARCHAR(250) NOT NULL,
                prenom_client VARCHAR(250) NOT NULL,
                id_compte INTEGER,
                id_adresse INTEGER NOT NULL
);


CREATE TABLE ocpizza.Restaurant (
                id_restaurant SERIAL PRIMARY KEY,
                nom_restaurant VARCHAR(250) NOT NULL,
                id_adresse INTEGER NOT NULL
);


CREATE TABLE ocpizza.Employe (
                id_employee SERIAL PRIMARY KEY,
                type_employee VARCHAR(20) NOT NULL,
                nom_employee VARCHAR(250) NOT NULL,
                prenom_employee VARCHAR(250) NOT NULL,
                id_restaurant INTEGER NOT NULL,
                id_compte INTEGER NOT NULL
);


CREATE TABLE ocpizza.Ingredient (
                id_ingredient SERIAL PRIMARY KEY,
                nom_ingredient VARCHAR(250) NOT NULL,
                quantiteU_ingredient VARCHAR(10) NOT NULL
);


CREATE TABLE ocpizza.Stock (
                id_ingredient INTEGER NOT NULL,
                id_restaurant INTEGER NOT NULL,
                quantite_stock VARCHAR(10) NOT NULL,
                CONSTRAINT id_stock PRIMARY KEY (id_ingredient, id_restaurant)
);


CREATE TABLE ocpizza.Pizza (
                id_pizza SERIAL PRIMARY KEY,
                nom_pizza VARCHAR(250) NOT NULL,
                prix_pizza DECIMAL(6) NOT NULL
);


CREATE TABLE ocpizza.Recette (
                id_pizza INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                quantite_recette VARCHAR(10) NOT NULL,
                CONSTRAINT id_recette PRIMARY KEY (id_pizza, id_ingredient)
);


CREATE TABLE ocpizza.Commande (
                id_commande SERIAL PRIMARY KEY,
                statut_commande VARCHAR(20) NOT NULL,
                date_commande DATE NOT NULL,
                prix_commande DECIMAL(6),
                id_client INTEGER NOT NULL,
                id_pizzaiolo INTEGER NOT NULL,
                id_vendeur INTEGER,
                id_livreur INTEGER,
                id_adresse INTEGER NOT NULL
);


CREATE TABLE ocpizza.Panier (
                id_commande INTEGER NOT NULL,
                id_pizza INTEGER NOT NULL,
                quantite_pizza INTEGER NOT NULL,
                CONSTRAINT id_panier PRIMARY KEY (id_commande, id_pizza)
);


ALTER TABLE ocpizza.Client ADD CONSTRAINT adresse_client_fk
FOREIGN KEY (id_adresse)
REFERENCES ocpizza.Adresse (id_adresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Commande ADD CONSTRAINT adresse_commande_fk
FOREIGN KEY (id_adresse)
REFERENCES ocpizza.Adresse (id_adresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Restaurant ADD CONSTRAINT adresse_restaurant_fk
FOREIGN KEY (id_adresse)
REFERENCES ocpizza.Adresse (id_adresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Client ADD CONSTRAINT compte_client_fk
FOREIGN KEY (id_compte)
REFERENCES ocpizza.Compte (id_compte)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Employe ADD CONSTRAINT compte_employe_fk
FOREIGN KEY (id_compte)
REFERENCES ocpizza.Compte (id_compte)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (id_client)
REFERENCES ocpizza.Client (id_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Employe ADD CONSTRAINT restaurant_employe_fk
FOREIGN KEY (id_restaurant)
REFERENCES ocpizza.Restaurant (id_restaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Stock ADD CONSTRAINT restaurant_stock_fk
FOREIGN KEY (id_restaurant)
REFERENCES ocpizza.Restaurant (id_restaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Commande ADD CONSTRAINT employe_commande_fk
FOREIGN KEY (id_pizzaiolo)
REFERENCES ocpizza.Employe (id_employee)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Commande ADD CONSTRAINT employe_commande_fk1
FOREIGN KEY (id_vendeur)
REFERENCES ocpizza.Employe (id_employee)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Commande ADD CONSTRAINT employe_commande_fk2
FOREIGN KEY (id_livreur)
REFERENCES ocpizza.Employe (id_employee)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Recette ADD CONSTRAINT ingredient_recette_fk
FOREIGN KEY (id_ingredient)
REFERENCES ocpizza.Ingredient (id_ingredient)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (id_ingredient)
REFERENCES ocpizza.Ingredient (id_ingredient)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Recette ADD CONSTRAINT pizza_recette_fk
FOREIGN KEY (id_pizza)
REFERENCES ocpizza.Pizza (id_pizza)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Panier ADD CONSTRAINT pizza_panier_fk
FOREIGN KEY (id_pizza)
REFERENCES ocpizza.Pizza (id_pizza)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ocpizza.Panier ADD CONSTRAINT commande_panier_fk
FOREIGN KEY (id_commande)
REFERENCES ocpizza.Commande (id_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;