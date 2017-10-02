//
//  Exercice_5.swift
//  Exercice
//
//  Created by SUP'Internet 09 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 08. All rights reserved.
//

import Foundation

extension ApiManager {
    func getRandomUserHydratedWithPerson(completion: @escaping (Person) -> Void){
        self.getRandomUser(completion: {
            data in
            var resultats = data as! [String:Any];
            //print(resultats["first"] as! [String:String])
            //var first = resultats["first"] as! [String:String]
            print(resultats)
            
            var name = resultats["name"] as! [String:String];
            //var last = resultats["last"] as! [String:String];
            //var email = resultats["email"] as! String;
        

            print(name["last"]!)
            //var lastname = resultats["last"] as! [String:String];
            //var email = resultats["email"]
            //print(name["first"]!)
        
            
            // PAS LE TEMPS : Person(firstname: name["first"]!, lastname: name["last"]!, gender: Person.Gender, email: "pasletemps@d.fr", birthdate: Date)
        })
    }
    
}
