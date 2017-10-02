//
//  main.swift
//  Exercice
//
//  Created by SUP'Internet 08 on 21/09/2017.
//  Copyright © 2017 SUP'Internet 08. All rights reserved.
//

import Foundation

print("Hello, World!")



//print(condog(str:"sylvain", prefix:"b", suffix:"aurevoir"));




//Exo 3


var date1 = "01-01-2000"
var date2 = "01-01-2018"



var myDate = date1.toDate(type: date1)
print(myDate)

print(myDate.getYearDifferenceFrom(date: Date()))

print(Existence(date: myDate).getAge())



var email = "sylvain@joly.fr"
print(Email(email: email).isValidEmail());



var personne = Person(firstname: "sylvain",
                      lastname: "Joly",
                      gender: Person.Gender.Male,
                      email: email,
                      birthdate: myDate)
print(personne.show());


var apimanager = ApiManager()
apimanager.getRandomUser(completion: {
    //data in print(data)
    data in
    var resultats = data as! [String:Any];
    //print(resultats["name"])

})


apimanager.getRandomUserHydratedWithPerson(completion: { person in
    person.show()
})
 

RunLoop.main.run();
