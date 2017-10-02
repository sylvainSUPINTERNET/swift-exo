//
//  Exercice_4.swift
//  Exercice
//
//  Created by SUP'Internet 09 on 28/09/2017.
//  Copyright © 2017 SUP'Internet 08. All rights reserved.
//

import Foundation


// 5 -> To do dans completion : instancier person with for each value of field correspond to api 
// to send :> 3 4 5 with email

class ApiManager{
    
    var baseUrl : String = "https://api.randomuser.me/"
    
    func getRandomUser(completion: @escaping (Any) -> Void){
        
        var request = URLRequest(url: URL(string: baseUrl)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, err in
            do{
                //print(data!)
            
                //Create a method to hydrate the fields of the class parents with data user
                completion(self.dataToJSON(data: data!) as Any)
            }catch let err as NSError{
                print(err)
            }
            }.resume()
    }
    
    
    func dataToJSON(data: Data) -> Any? {
        do {
            var json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
            var result = json?["results"] as! NSArray        
            return result[0]
            
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    
}
