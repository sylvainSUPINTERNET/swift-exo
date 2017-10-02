//
//  Car.swift
//  Exercice
//
//  Created by SUP'Internet 08 on 21/09/2017.
//  Copyright © 2017 SUP'Internet 08. All rights reserved.
//

import Foundation



//Protocole (equivalent de interface en php)

// Pas de corps dans le protocol! (par contre obligatoire de l'implement et delui définir un body dans la class dans lequel il est utilisé)
protocol ItemProtocol {
    func getColor()-> String
}



//class to heritate (PARENT)

class Item: ItemProtocol {
    let color:String
    
    init(color: String){
        self.color = color
    }
    
    
    //Pas besoin de appeler la methode dans la classe enfant (via le constructeur elle y est passé)
    func getColor() -> String {
        return self.color
    }
}



//Class qui hérite (enfant de Item)
class Car: Item {
    
    var name:String;
    
    //ENUM
    var fuel: Fuel;
    
    //ENUM
    enum Fuel{
        case Gaz, Essences
    }
    
    
    init(str: String){
        
        self.name = str
        if(name == "Clio"){
            self.fuel = .Essences // equivalent de fuel.Essence
        }else{
            self.fuel = .Gaz // equivalent de fuel.Gaz
        }
 
        super.init(color: "red") //le super init doit être tout en bas de l'init de la class enfant
       
    }
}


//Extension permet d'ajouter des function a notre classe
extension Car {
    
    func say(str: String){
        print(str)
    }
}


//Extension permet d'ajouter au type String cette methode par exemple
extension String {
    //a partir d'une string on pourra dire hello
    func hello(str: String){
        print(str)
    }
}

