//SPDX-License-Identifier: UNLICENSED

//On choisit la version du compilateur
pragma solidity >=0.4.22 <0.9.0;
//On déclare notre contrat
contract ShippingContract {        

    //On crée une liste qui correspond aux états possible de notre commande
    enum Etat{ Pending, Shipped, Delivered }
    Etat choix;

    //On crée les evenements possible pour nos commandes
    event Create(uint id, Etat);
    event Shipped(uint id, Etat);
    event Delivered(uint id, Etat);
    //On crée la structure Ship qui correspond à un objet "commande". On créera cet objet a chaque élément acheté.
    struct Ship{
        uint id;
        Etat etat;
    }

    //On crée un tableau pour stocker toutes les commandes (les objets Ship)
    Ship[] public ships;

    //On crée une commande et on ajoute la commande créée à la liste de toutes les commandes
    function createShip(uint _id) public{
        ships.push(Ship(_id,Etat.Pending));
        emit Create(_id,Etat.Pending); // On déclenche l'event "Create" pour signifier que la commande a été créée et est en attente
    }

    //On récupère la valeur de la variable "choix" qui représenté l'état de la commande
    function getChoix() public view returns (Etat) {
      return choix;
   }

    //Fonction qui change le statut de la commande à "Shipped" lorsque la commande est envoyée
    function shipSent(uint _id) public{
        choix = Etat.Shipped;
        emit Shipped(_id,choix); // On déclenche l'event "Shipped" pour signifier que la commande a été envoyée
    }
    //Fonction qui change le statut de la commande à "Delivered" lorsque la commande est délivrée
    function shipDelivered(uint _id) public{
        choix = Etat.Delivered;
        emit Delivered(_id,choix); // On déclenche l'event "Delivered" pour signifier que la commande a été délivrée
    }

}