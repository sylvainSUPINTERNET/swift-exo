//
//  Exercice_3.swift
//  Exercice
//
//  Created by SUP'Internet 09 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 08. All rights reserved.
//

import Foundation




extension String {
    func toDate(type: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = type //"dd-mm-yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = dateFormatter.date(from: self)
        //print(date ?? "")
        return date!
    }
}


extension Date{
    func toString(format:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let newDate = dateFormatter.string(from: self)
        return newDate;
    }
    
    
    func getYearDifferenceFrom(date:Date)->Int{
        return Calendar.current.dateComponents([.year], from: date, to: self).year! * -1 ?? 0
    }
}




struct Email:CustomStringConvertible{
    var email: String?;
    
    var description: String {
        return "(\(self.email!))"
    }
    
    init(email: String){
            self.email = email
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.email)
    }
}


class Existence {
    var birthday = Date();
    var age: Int = 0;
    
    
    init(date: Date?){
        self.birthday = date! as Date;
        self.age = birthday.getYearDifferenceFrom(date: Date());
    }
    
    func willProbablyDieSoon()->Bool{
        if(self.age > 100){
            return true;
        }else{
            return false;
        }
    }
    
    func getAge()->Int{
        print(self.age);
        return self.age;
    }
}


class Person:Existence {
    
    var gender: Gender
    var firstname: String
    var lastname: String
    var email: Email
    
    enum Gender {
        case Male, Female, Other
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: (date: String, format: String)) {
        self.gender = gender
        self.firstname = firstname
        self.lastname = lastname
        self.email = Email(email: email)
        
        super.init(date: birthdate.date.toDate(type: birthdate.format))
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: Date) {
        self.gender = gender
        self.firstname = firstname
        self.lastname = lastname
        self.email = Email(email: email)
        
        super.init(date: birthdate)
    }
    
    func show() {
        print("firstname : \(self.firstname) ")
        print("lastname : \(self.lastname) ")
        
        switch self.gender {
        case .Male:
            print("gender : Male")
        case .Female:
            print("gender : Male")
        case .Other:
            print("gender : Other")
        }
        
        print("email valid : \(self.email.isValidEmail())")
        print("email : \(self.email)")
        
        print("birthdate : \(self.birthday)")
        print("age : \(self.age)")
        print("will die soon : \(self.willProbablyDieSoon())")
    }
    
 
}












 
